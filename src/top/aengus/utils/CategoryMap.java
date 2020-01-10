package top.aengus.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Aengus Sun
 * Email: sys6511@126.com | sunyongsheng6511@gmail.com
 * @link https://www.aengus.top
 * @since 2020/1/10
 */
public class CategoryMap {
    public static Map<String, String> categoryMap = new HashMap<>();
    static {
        categoryMap.put("体育", "sports");
        categoryMap.put("财经", "finance");
        categoryMap.put("时政", "current-politics");
        categoryMap.put("教育", "education");
        categoryMap.put("文化", "culture");
        categoryMap.put("科技", "technology");
    }
}
