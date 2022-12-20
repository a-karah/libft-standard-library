#include "template.h"

int	print_hello(void)
{
	return (write(1, "Hello, World!\n", 14));
}
