#ifdef LLVM_MOS
#define __NOINLINE__ __attribute__((noinline))
#else
#define __NOINLINE__ __noinline
#endif

#include <stdio.h>

const unsigned char tile[4] = { 81, 82, 83, 84 };

__NOINLINE__ void draw(const unsigned char i)
{
	unsigned char *ptr = (unsigned char *)0x0400;

	#pragma unroll(0)
	for (unsigned char y = 0; y < 25; y += 2)
	{
		unsigned char *off3 = ptr;
		#pragma unroll(0)
		for (unsigned char x = 0; x < 40; x += 2)
		{
			unsigned char *off = off3;
			unsigned char ix = 0;
			#pragma unroll(0)
			for (unsigned char ty = 0; ty < 2; ++ty)
			{
				unsigned char *off2 = off;
				#pragma unroll(0)
				for (unsigned char tx = 0; tx < 2; ++tx) {
					off2[tx] = tile[ix++];
				}
				off += 40;
			}
			off3 += 2;
		}
		ptr += 80;
	}
}

volatile unsigned int tm = 0;

void timer()
{
	++tm;
#ifdef LLVM_MOS
	__asm__("jmp $ea31" : : :);
#else
	__asm {
		jmp $ea31
	}
#endif
}

void clear()
{
#ifdef LLVM_MOS
	__asm__("jsr $e544" : : :);
#else
	__asm {
		jsr $e544
	}
#endif
}

int main()
{
	*((void **)0x314) = (void **)&timer;

	for (unsigned char i = 0; i < 100; ++i) {
		draw(i);
	}
	
	clear();

	printf("TIME: %u\n", tm);

    return 0;
}
