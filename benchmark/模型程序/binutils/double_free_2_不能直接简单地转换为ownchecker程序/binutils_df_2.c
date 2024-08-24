#include "../include/common.h"
#include "../include/binutils.h"
#include "../include/bfd.h"

/* buggy parent: cc917fd
	commit id: be74fad95edc8827516e144cf38d135b503249cd
*/

typedef int bool;
typedef int bfd_vma;
typedef bool bfd_boolean;
typedef int Elf_Internal_Rela;

struct link_info {
	bool keep_memory;
};

struct alpha_relax_info {
	struct bfd *abfd;
	struct link_info* link_info;
};

typedef struct bfd bfd;

static bfd_vma
elf64_alpha_relax_opt_call (struct alpha_relax_info *info,
		bfd_vma symval)
{
	Elf_Internal_Rela *tsec_relocs, *tsec_free;

	tsec_relocs = __(Elf_Internal_Rela *)malloc(sizeof(Elf_Internal_Rela)); /* allocation site */

	if (tsec_relocs == NULL)
		return 0;
    else {
	 *((int *)tsec_relocs) = 1;

	 tsec_free = tsec_relocs;
	
	 if (tsec_free)
		free(tsec_free);	/* double-free */

	 return 0;
	}
}

static bfd_boolean
elf64_alpha_relax_with_lituse (struct alpha_relax_info *info, bfd_vma symval)
{
  bfd *abfd = info->abfd;
	Elf_Internal_Rela *internal_relocs = _(Elf_Internal_Rela *)malloc(sizeof(Elf_Internal_Rela)); /* allocation site */

	bfd_vma optdest = elf64_alpha_relax_opt_call(info, symval);
	free(internal_relocs);	/* double-free */
}

int main() {

	bfd_vma symval = 1;
	struct alpha_relax_info info;
	bfd bfd;
	struct link_info link_info;

	bfd.memory = malloc(sizeof(Elf_Internal_Rela));

	info.abfd = &bfd;
	info.link_info = &link_info;

	elf64_alpha_relax_with_lituse(&info, symval);

	*((int *)bfd.memory) = 1;	
	free(bfd.memory);
}

