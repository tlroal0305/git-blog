public class AccessObjEx extends AccessObj{
    public static void main(String[] args) {
        AccessObj obj = new AccessObj();
        System.out.println(obj.p1);
        System.out.println(obj.p2);
        // p3은 private로 다른 패키지에 있어서 불러올 수 X

        // p4는 default로 다른 패키지에 있어서 불러올 수 X
        System.out.println(obj.p4);
    }
}
