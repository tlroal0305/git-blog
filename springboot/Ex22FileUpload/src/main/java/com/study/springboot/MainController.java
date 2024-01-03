package com.study.springboot;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class MainController {
    @GetMapping("/")
    public String main(){
        // upload.html 응답
        return "upload";
    }

    @PostMapping("/upload")
    public String upload(@RequestParam MultipartFile[] uploadfile,
                         Model model) throws IOException {
        List<FileDto> fileList = new ArrayList<>();

        for (MultipartFile file : uploadfile ){
            if( !file.isEmpty() ){
                // 중복되지 않는 랜덤한 파일 이름 만들기
                // 1. UUID -> 많은 양의 사진을 보내고 받을 때 사용
                // 2. YYYY-mm-dd-HH-ss ( 랜덤수 0000~9999 ) -> 보다 적은 양의 사진을 보내고 받을 때 사용
                // getOriginalFilename() : 원래 파일 이름
                // getContentType() : 콘텐츠 형식 image/png, application/json
                FileDto dto = new FileDto(
                        UUID.randomUUID().toString(),
                        file.getOriginalFilename(),
                        file.getContentType());
                fileList.add(dto);

                File newFileName = new File(dto.getUuid() +
                        "_" + dto.getFileName());
                // .transferTo() : 전송된 파일 데이터를 서버 파일로 저장하는 함수
                //                 try/catch문으로 감싸거나 예외 처리해야 함
                file.transferTo( newFileName );
            }
        }

        model.addAttribute("files", fileList);

        return "result";
    }

    // application.properties에 등록된 파일의 경로를 가져옴
    @Value("${spring.servlet.multipart.location}")
    String filePath;

    // @ModelAttribute : Get파라미터의 DTO 맵핑을 해줌
    @GetMapping("/download")
    public ResponseEntity<Resource> download(@ModelAttribute FileDto dto) throws IOException {
        Path path = Paths.get(filePath + "/" + dto.getUuid() + "_" + dto.getFileName());
        String contentType = Files.probeContentType(path);
        // http header를 통해서 다운로드 되는 파일의 정보를 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDisposition(ContentDisposition.builder("attachment")
                .filename(dto.getFileName(), StandardCharsets.UTF_8)
                .build());
        headers.add(HttpHeaders.CONTENT_TYPE, contentType);

        Resource resource = (Resource) new InputStreamResource(Files.newInputStream(path));
        return new ResponseEntity<>(resource, headers, HttpStatus.OK);
    }

    @GetMapping("/ckeditor4")
    public String ckeditor4(){
        return "upload_ckeditor4"; //upload_ckeditor4.html로 응답
    }

    @Autowired
    private UploadService uploadService;

    //CKEditor4에서 파일업로드 호출
    //응답은 서버에서 JSON문자열로 내려주면, CKEditor에서 결과를 확인하고 표시함.

    //업로드 후에, 컴파일후 재기동해야 서버 리소스가 준비됨.
    @PostMapping("/ckUpload")
    // MultipartFile 파라미터명 고정!
    @ResponseBody
    // ResponseEntity : HttpEntity를 상속받은 응답용 객체
    public ResponseEntity<CKResponse> ckImageUpload(MultipartFile /* 파라미터명 upload로 고정 */ upload) {
        CKResponse ckResponse = uploadService.ckImageUpload(upload);

        // json 데이터로 등록
        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
        // 이런 형태로 리턴이 나가야함.
        return ResponseEntity.ok(ckResponse);
    }

}
