#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main(void)
{
    if(!fork())
    {
        _exit(0);
    }
    sleep(60);
    
    return 0;
}