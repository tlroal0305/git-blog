public class MethodOverloadEx {
    public static void main(String[] args) {
        // 생성한 클래스를 사용하려면 객체 먼저 불러오기
        MyClass myClass = new MyClass();

        System.out.println(myClass.plus(4, 5));
        System.out.println(myClass.plus(4,6,7));
        System.out.println(myClass.plus("ye","rim"));
    }
}
