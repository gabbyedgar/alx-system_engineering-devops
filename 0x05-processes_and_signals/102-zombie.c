#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

/**
 * infinite_while - infinite loop to occupy child processes and parent
 *
 * Return: 0 always
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - program to fork 5 child processes but not wait for them
 *
 * Return: return value from `infinite_while`
 */
int main(void)
{
	pid_t zombie;
	size_t i;

	for (i = 0; i < 5; i++)
	{
		zombie = fork();
		if (zombie < 0)
			perror("fork");
		else if (zombie == 0)
			exit(0);
		else
			printf("Zombie process created, PID: %ld\n",
			       (long) zombie);
	}
	return (infinite_while());
}
