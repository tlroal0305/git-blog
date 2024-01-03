// 타입 or 매개 변수의 수가 달라 메소드가 실행
// 전부 동일하면 실행 X
public class MyClass {
    public int plus (int x, int y){
        return x + y;
    }

    public int plus (int x, int y, int z){
        return x + y + z;
    }

    public String plus (String x, String y){
        return x + y;
    }

    static class Car {
        void run() {
            System.out.println("차가 달립니다.");
        }

        // 정수 하나를 매개변수로 받는 메소드, run을 추가해 보세요.
        public int run(int num){
            return num;
        }

    }
}

