
# include "list.h"

int failed;
int test_count;


void test_atoi_base_10(char *str)
{
    test_count++;
    int ret = ft_atoi_base(str, "0123456789");
    int atoi_base = atoi(str);
    if (ret == atoi_base)
        printf("ft_atoi_base 10: \x1b[32mOK\n\n");
    else
    {
        printf("ft_atoi_base 10: \x1b[31mKO\n\n");
        failed++;
    }
    printf("str: %s\n", str);
    printf("atoi_base: %d\n", atoi_base);
    printf("ft_atoi_base: %d\033[0m\n\n", ret);
}

void test_atoi_base(char *str, char *base, int expected)
{
    test_count++;
    int ret = ft_atoi_base(str, base);
    if (ret == expected)
        printf("ft_atoi_base: \x1b[32mOK\n\n");
    else
    {
        printf("ft_atoi_base: \x1b[31mKO\n\n");
        failed++;
    }
    printf("str: %s\n", str);
    printf("base: %s\n", base);
    printf("expected: %d\n", expected);
    printf("ft_atoi_base: %d\033[0m\n\n", ret);
}

void test_bonus(void)
{
        test_atoi_base_10("42");
        test_atoi_base_10("0");
        test_atoi_base_10("1");
        test_atoi_base_10("1215415478");
        test_atoi_base("42", "0123456789", 42);
        test_atoi_base("0", "0123456789", 0);
        test_atoi_base("1", "0123456789", 1);
        test_atoi_base("1215415478", "0123456789", 1215415478);
        test_atoi_base("-0", "0123456789", 0);
        test_atoi_base("-1", "0123456789", -1);
        test_atoi_base("-42", "0123456789", -42);
        test_atoi_base("123", "+", 0);
        test_atoi_base("123", " 0123456789", 0);
        test_atoi_base("123", "0123456789+", 0);
        test_atoi_base("123", "0123456789\n", 0);


        return 0;
}