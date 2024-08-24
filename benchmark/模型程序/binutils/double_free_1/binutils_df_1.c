/*
	buggy parent : a9f42cf
	commit id : 09473be85c13eab0d794e363d898b74d66431d72
*/

#include "../include/common.h"
#define PT_LDINFO 1

typedef int ptid_t;
typedef unsigned char bfd_byte;
typedef bfd_byte gdb_byte;
typedef unsigned long ULONGEST;

enum target_xfer_status
{
  /* Some bytes are transferred.  */
  TARGET_XFER_OK = 1,

  /* No further transfer is possible.  */
  TARGET_XFER_EOF = 0,

  /* The piece of the object requested is unavailable.  */
  TARGET_XFER_UNAVAILABLE = 2,

  /* Generic I/O error.  Note that it's important that this is '-1',
     as we still have target_xfer-related code returning hardcoded
     '-1' on error.  */
  TARGET_XFER_E_IO = -1,

  /* Keep list in sync with target_xfer_status_to_string.  */
};

static enum target_xfer_status rs6000_xfer_shared_libraries
  (const gdb_byte *writebuf, ULONGEST *xfered_len)
{
	gdb_byte *ldi_buf;
	ULONGEST result;
	struct cleanup *cleanup;

  if (writebuf)
    return TARGET_XFER_E_IO;

  ldi_buf = malloc (2024); /* allocation site */
  cleanup = make_cleanup (free, ldi_buf); //库函数，认为ldi_buf不转移所有权
  result = *ldi_buf;

  free(ldi_buf);	/* free*/
  free(ldi_buf);	/* double-free */

  if (result == 0)
    return TARGET_XFER_EOF;
  else
    {
      *xfered_len = result;
      return TARGET_XFER_OK;
    }
}

int main() {

	int len;
	gdb_byte *writebuf;
	ULONGEST *xfered_len = &len;

	rs6000_xfer_shared_libraries(writebuf, xfered_len);
}
