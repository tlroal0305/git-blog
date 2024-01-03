public class MyThread extends Thread{
    String str;

    public MyThread(String str){
        this.str = str;
    }

    // 다른 흐름의 메인 메서드라고 생각
    // @Override : 상위 타입 ( 부모 타입 )의 메서드를 재정의
    @Override
    public void run() {
        super.run();
    }
}
