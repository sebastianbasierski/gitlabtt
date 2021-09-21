#include "CUnit/Basic.h"
#include <stdio.h>
#include "../src/main.c"

int init_suite_main(void) {
    return 0;
}

int clean_suite_main(void) {
    return 0;
}

void test_dummy(void) {
}


#undef main
int main() {
    CU_pSuite pSuite = NULL;

    if (CUE_SUCCESS != CU_initialize_registry()) {
        return CU_get_error();
    }

    pSuite = CU_add_suite("Suite_main", init_suite_main, clean_suite_main);
    if (NULL == pSuite) {
        CU_cleanup_registry();
        return CU_get_error();
    }

    if ((NULL == CU_add_test(pSuite, "dummy test()", test_dummy))) {
        CU_cleanup_registry();
        return CU_get_error();
    }
    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();

    return CU_get_error();
}