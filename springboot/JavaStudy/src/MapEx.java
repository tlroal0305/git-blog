import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapEx {
    public static void main(String[] args) {
        // Map< Key's type, Value's type>
        Map<String, String> map = new HashMap<>();
        map.put("001", "kim");
        map.put("002", "lee");
        map.put("003", "choi");

        map.put("002", "lee");

        System.out.println(map.size()); // 같은 Key로 2번 담았기 때문에 size()는 3으로 출력
        System.out.println(map.get("002")); // 같은 Key로 값이 들어오면 새로운 값으로 바뀜
        System.out.println();

        Set<String> keys = map.keySet();
        // iterator는 ArrayList, HashSet 등 컬렉션을 반복하는 데 사용할 수 있는 객체
        Iterator<String> iter = keys.iterator();
        while (iter.hasNext()){
            // next() : 값을 하나씩 꺼내줌
            String key = iter.next();
            String value = map.get(key);
            System.out.println( key + ":" + value);

        }
    }
}
