public class BusEx {
    public static void main(String[] args) {
        // Bus 클래스에는 아무것도 없지만 Car 클래스에 run() 메소드가 있기 때문에
        //  run() 메소드가 실행
        // Bus가 Car를 상속받고 있기 때문 !
        Bus bus = new Bus();
        bus.run();
        bus.ppangppagn();

        // Car가 Bus를 상속받고 있지 않기 때문에 pangpang() 메소드는 실행 X
        Car car = new Car();
        car.run();


    }
}
