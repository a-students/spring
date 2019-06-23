package Until;

import java.util.UUID;

public class CodeUntil {
    public static String getcode() {
        return UUID.randomUUID().toString().substring(0, 5);
    }
}
