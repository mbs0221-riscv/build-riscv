#include <sys/types.h>
#include <stdio.h>
#include <pwd.h>

int main(int argc, char ** argv) {

    struct passwd * pw = NULL;

    pw = getpwnam("root");
    if (!pw) {
        fprintf(stderr, "getpwnam failed!\n");
        return 1;
    }

    fprintf(stdout, "getpwnam results:\n");
    fprintf(stdout, "user:\t%s\n", pw->pw_name);
    fprintf(stdout, "crypt:\t%s\n", pw->pw_passwd);
    fprintf(stdout, "uid:\t%d\n", pw->pw_uid);
    fprintf(stdout, "gid:\t%d\n", pw->pw_gid);
    fprintf(stdout, "home:\t%s\n", pw->pw_dir);
    fprintf(stdout, "shell\t%s\n", pw->pw_shell);

    return 0;
}

