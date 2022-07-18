package com.macro.mall.common.api;

import javax.validation.groups.Default;

/**
 * @author ttc
 * @version 1.0
 * @date 2022/4/28 18:02
 * @desc ...
 */
public class Operation {
    public static interface Creation extends Default {
    }

    public static interface Update extends Default {
    }

    public static interface Delete extends Default {
    }
}
