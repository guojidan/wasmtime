;;! target = "x86_64"
;;! test = "winch"
(module
    (func (result i32)
	(i32.const 0x7fffffff)
	(i32.const -1)
	(i32.mul)
    )
)
;; wasm[0]::function[0]:
;;       pushq   %rbp
;;       movq    %rsp, %rbp
;;       movq    8(%rdi), %r11
;;       movq    0x10(%r11), %r11
;;       addq    $0x10, %r11
;;       cmpq    %rsp, %r11
;;       ja      0x40
;;   1c: movq    %rdi, %r14
;;       subq    $0x10, %rsp
;;       movq    %rdi, 8(%rsp)
;;       movq    %rsi, (%rsp)
;;       movl    $0x7fffffff, %eax
;;       imull   $-1, %eax, %eax
;;       addq    $0x10, %rsp
;;       popq    %rbp
;;       retq
;;   40: ud2
