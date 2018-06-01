; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -fast-isel -mtriple=i386-unknown-unknown -mattr=+avx512f,+avx512vbmi2 | FileCheck %s --check-prefix=ALL --check-prefix=X32
; RUN: llc < %s -fast-isel -mtriple=x86_64-unknown-unknown -mattr=+avx512f,+avx512vbmi2 | FileCheck %s --check-prefix=ALL --check-prefix=X64

; NOTE: This should use IR equivalent to what is generated by clang/test/CodeGen/avx512vbmi2-builtins.c

define <8 x i64> @test_mm512_mask_compress_epi16(<8 x i64> %__S, i32 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_mask_compress_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpcompressw %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_compress_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpcompressw %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <32 x i16>
  %1 = bitcast <8 x i64> %__S to <32 x i16>
  %2 = tail call <32 x i16> @llvm.x86.avx512.mask.compress.w.512(<32 x i16> %0, <32 x i16> %1, i32 %__U)
  %3 = bitcast <32 x i16> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_maskz_compress_epi16(i32 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_maskz_compress_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpcompressw %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_compress_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpcompressw %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <32 x i16>
  %1 = tail call <32 x i16> @llvm.x86.avx512.mask.compress.w.512(<32 x i16> %0, <32 x i16> zeroinitializer, i32 %__U)
  %2 = bitcast <32 x i16> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <8 x i64> @test_mm512_mask_compress_epi8(<8 x i64> %__S, i64 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_mask_compress_epi8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k0
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    kunpckdq %k1, %k0, %k1
; X32-NEXT:    vpcompressb %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_compress_epi8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovq %rdi, %k1
; X64-NEXT:    vpcompressb %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <64 x i8>
  %1 = bitcast <8 x i64> %__S to <64 x i8>
  %2 = tail call <64 x i8> @llvm.x86.avx512.mask.compress.b.512(<64 x i8> %0, <64 x i8> %1, i64 %__U)
  %3 = bitcast <64 x i8> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_maskz_compress_epi8(i64 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_maskz_compress_epi8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k0
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    kunpckdq %k1, %k0, %k1
; X32-NEXT:    vpcompressb %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_compress_epi8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovq %rdi, %k1
; X64-NEXT:    vpcompressb %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <64 x i8>
  %1 = tail call <64 x i8> @llvm.x86.avx512.mask.compress.b.512(<64 x i8> %0, <64 x i8> zeroinitializer, i64 %__U)
  %2 = bitcast <64 x i8> %1 to <8 x i64>
  ret <8 x i64> %2
}

define void @test_mm512_mask_compressstoreu_epi16(i8* %__P, i32 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_mask_compressstoreu_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    vpcompressw %zmm0, (%eax) {%k1}
; X32-NEXT:    vzeroupper
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_compressstoreu_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %esi, %k1
; X64-NEXT:    vpcompressw %zmm0, (%rdi) {%k1}
; X64-NEXT:    vzeroupper
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <32 x i16>
  tail call void @llvm.x86.avx512.mask.compress.store.w.512(i8* %__P, <32 x i16> %0, i32 %__U)
  ret void
}

define void @test_mm512_mask_compressstoreu_epi8(i8* %__P, i64 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_mask_compressstoreu_epi8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k0
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    kunpckdq %k1, %k0, %k1
; X32-NEXT:    vpcompressb %zmm0, (%eax) {%k1}
; X32-NEXT:    vzeroupper
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_compressstoreu_epi8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovq %rsi, %k1
; X64-NEXT:    vpcompressb %zmm0, (%rdi) {%k1}
; X64-NEXT:    vzeroupper
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <64 x i8>
  tail call void @llvm.x86.avx512.mask.compress.store.b.512(i8* %__P, <64 x i8> %0, i64 %__U)
  ret void
}

define <8 x i64> @test_mm512_mask_expand_epi16(<8 x i64> %__S, i32 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_mask_expand_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpexpandw %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_expand_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpexpandw %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <32 x i16>
  %1 = bitcast <8 x i64> %__S to <32 x i16>
  %2 = tail call <32 x i16> @llvm.x86.avx512.mask.expand.w.512(<32 x i16> %0, <32 x i16> %1, i32 %__U)
  %3 = bitcast <32 x i16> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_maskz_expand_epi16(i32 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_maskz_expand_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpexpandw %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_expand_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpexpandw %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <32 x i16>
  %1 = tail call <32 x i16> @llvm.x86.avx512.mask.expand.w.512(<32 x i16> %0, <32 x i16> zeroinitializer, i32 %__U)
  %2 = bitcast <32 x i16> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <8 x i64> @test_mm512_mask_expand_epi8(<8 x i64> %__S, i64 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_mask_expand_epi8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k0
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    kunpckdq %k1, %k0, %k1
; X32-NEXT:    vpexpandb %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_expand_epi8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovq %rdi, %k1
; X64-NEXT:    vpexpandb %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <64 x i8>
  %1 = bitcast <8 x i64> %__S to <64 x i8>
  %2 = tail call <64 x i8> @llvm.x86.avx512.mask.expand.b.512(<64 x i8> %0, <64 x i8> %1, i64 %__U)
  %3 = bitcast <64 x i8> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_maskz_expand_epi8(i64 %__U, <8 x i64> %__D) {
; X32-LABEL: test_mm512_maskz_expand_epi8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k0
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    kunpckdq %k1, %k0, %k1
; X32-NEXT:    vpexpandb %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_expand_epi8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovq %rdi, %k1
; X64-NEXT:    vpexpandb %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__D to <64 x i8>
  %1 = tail call <64 x i8> @llvm.x86.avx512.mask.expand.b.512(<64 x i8> %0, <64 x i8> zeroinitializer, i64 %__U)
  %2 = bitcast <64 x i8> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <8 x i64> @test_mm512_mask_expandloadu_epi16(<8 x i64> %__S, i32 %__U, i8* readonly %__P) {
; X32-LABEL: test_mm512_mask_expandloadu_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpexpandw (%eax), %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_expandloadu_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpexpandw (%rsi), %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <32 x i16>
  %1 = tail call <32 x i16> @llvm.x86.avx512.mask.expand.load.w.512(i8* %__P, <32 x i16> %0, i32 %__U)
  %2 = bitcast <32 x i16> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <8 x i64> @test_mm512_maskz_expandloadu_epi16(i32 %__U, i8* readonly %__P) {
; X32-LABEL: test_mm512_maskz_expandloadu_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpxor %xmm0, %xmm0, %xmm0
; X32-NEXT:    vpexpandw (%eax), %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_expandloadu_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpxor %xmm0, %xmm0, %xmm0
; X64-NEXT:    vpexpandw (%rsi), %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = tail call <32 x i16> @llvm.x86.avx512.mask.expand.load.w.512(i8* %__P, <32 x i16> zeroinitializer, i32 %__U)
  %1 = bitcast <32 x i16> %0 to <8 x i64>
  ret <8 x i64> %1
}

define <8 x i64> @test_mm512_mask_expandloadu_epi8(<8 x i64> %__S, i64 %__U, i8* readonly %__P) {
; X32-LABEL: test_mm512_mask_expandloadu_epi8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k0
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    kunpckdq %k1, %k0, %k1
; X32-NEXT:    vpexpandb (%eax), %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_expandloadu_epi8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovq %rdi, %k1
; X64-NEXT:    vpexpandb (%rsi), %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <64 x i8>
  %1 = tail call <64 x i8> @llvm.x86.avx512.mask.expand.load.b.512(i8* %__P, <64 x i8> %0, i64 %__U)
  %2 = bitcast <64 x i8> %1 to <8 x i64>
  ret <8 x i64> %2
}

define <8 x i64> @test_mm512_maskz_expandloadu_epi8(i64 %__U, i8* readonly %__P) {
; X32-LABEL: test_mm512_maskz_expandloadu_epi8:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k0
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    kunpckdq %k1, %k0, %k1
; X32-NEXT:    vpxor %xmm0, %xmm0, %xmm0
; X32-NEXT:    vpexpandb (%eax), %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_expandloadu_epi8:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovq %rdi, %k1
; X64-NEXT:    vpxor %xmm0, %xmm0, %xmm0
; X64-NEXT:    vpexpandb (%rsi), %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = tail call <64 x i8> @llvm.x86.avx512.mask.expand.load.b.512(i8* %__P, <64 x i8> zeroinitializer, i64 %__U)
  %1 = bitcast <64 x i8> %0 to <8 x i64>
  ret <8 x i64> %1
}

define <8 x i64> @test_mm512_mask_shldi_epi64(<8 x i64> %__S, i8 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shldi_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshldq $127, %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shldi_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldq $127, %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshld.q.512(<8 x i64> %__A, <8 x i64> %__B, i32 127, <8 x i64> %__S, i8 %__U)
  ret <8 x i64> %0
}

declare <8 x i64> @llvm.x86.avx512.mask.vpshld.q.512(<8 x i64>, <8 x i64>, i32, <8 x i64>, i8)

define <8 x i64> @test_mm512_maskz_shldi_epi64(i8 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shldi_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshldq $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shldi_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldq $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshld.q.512(<8 x i64> %__A, <8 x i64> %__B, i32 63, <8 x i64> zeroinitializer, i8 %__U)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_shldi_epi64(<8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shldi_epi64:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshldq $31, %zmm1, %zmm0, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshld.q.512(<8 x i64> %__A, <8 x i64> %__B, i32 31, <8 x i64> zeroinitializer, i8 -1)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_mask_shldi_epi32(<8 x i64> %__S, i16 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shldi_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldd $127, %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shldi_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldd $127, %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <16 x i32>
  %1 = bitcast <8 x i64> %__B to <16 x i32>
  %2 = bitcast <8 x i64> %__S to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshld.d.512(<16 x i32> %0, <16 x i32> %1, i32 127, <16 x i32> %2, i16 %__U)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

declare <16 x i32> @llvm.x86.avx512.mask.vpshld.d.512(<16 x i32>, <16 x i32>, i32, <16 x i32>, i16)

define <8 x i64> @test_mm512_maskz_shldi_epi32(i16 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shldi_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldd $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shldi_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldd $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <16 x i32>
  %1 = bitcast <8 x i64> %__B to <16 x i32>
  %2 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshld.d.512(<16 x i32> %0, <16 x i32> %1, i32 63, <16 x i32> zeroinitializer, i16 %__U)
  %3 = bitcast <16 x i32> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_shldi_epi32(<8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shldi_epi32:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshldd $31, %zmm1, %zmm0, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__A to <16 x i32>
  %1 = bitcast <8 x i64> %__B to <16 x i32>
  %2 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshld.d.512(<16 x i32> %0, <16 x i32> %1, i32 31, <16 x i32> zeroinitializer, i16 -1)
  %3 = bitcast <16 x i32> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_mask_shldi_epi16(<8 x i64> %__S, i32 %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shldi_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldw $127, %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shldi_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldw $127, %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <32 x i16>
  %1 = bitcast <8 x i64> %__B to <32 x i16>
  %2 = bitcast <8 x i64> %__S to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshld.w.512(<32 x i16> %0, <32 x i16> %1, i32 127, <32 x i16> %2, i32 %__U)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

declare <32 x i16> @llvm.x86.avx512.mask.vpshld.w.512(<32 x i16>, <32 x i16>, i32, <32 x i16>, i32)

define <8 x i64> @test_mm512_maskz_shldi_epi16(i32 %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shldi_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldw $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shldi_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldw $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <32 x i16>
  %1 = bitcast <8 x i64> %__B to <32 x i16>
  %2 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshld.w.512(<32 x i16> %0, <32 x i16> %1, i32 63, <32 x i16> zeroinitializer, i32 %__U)
  %3 = bitcast <32 x i16> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_shldi_epi16(<8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shldi_epi16:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshldw $31, %zmm1, %zmm0, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__A to <32 x i16>
  %1 = bitcast <8 x i64> %__B to <32 x i16>
  %2 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshld.w.512(<32 x i16> %0, <32 x i16> %1, i32 31, <32 x i16> zeroinitializer, i32 -1)
  %3 = bitcast <32 x i16> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_mask_shrdi_epi64(<8 x i64> %__S, i8 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shrdi_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshrdq $127, %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shrdi_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdq $127, %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshrd.q.512(<8 x i64> %__A, <8 x i64> %__B, i32 127, <8 x i64> %__S, i8 %__U)
  ret <8 x i64> %0
}

declare <8 x i64> @llvm.x86.avx512.mask.vpshrd.q.512(<8 x i64>, <8 x i64>, i32, <8 x i64>, i8)

define <8 x i64> @test_mm512_maskz_shrdi_epi64(i8 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shrdi_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshrdq $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shrdi_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdq $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshrd.q.512(<8 x i64> %__A, <8 x i64> %__B, i32 63, <8 x i64> zeroinitializer, i8 %__U)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_shrdi_epi64(<8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shrdi_epi64:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshrdq $31, %zmm1, %zmm0, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshrd.q.512(<8 x i64> %__A, <8 x i64> %__B, i32 31, <8 x i64> zeroinitializer, i8 -1)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_mask_shrdi_epi32(<8 x i64> %__S, i16 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shrdi_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdd $127, %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shrdi_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdd $127, %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <16 x i32>
  %1 = bitcast <8 x i64> %__B to <16 x i32>
  %2 = bitcast <8 x i64> %__S to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshrd.d.512(<16 x i32> %0, <16 x i32> %1, i32 127, <16 x i32> %2, i16 %__U)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

declare <16 x i32> @llvm.x86.avx512.mask.vpshrd.d.512(<16 x i32>, <16 x i32>, i32, <16 x i32>, i16)

define <8 x i64> @test_mm512_maskz_shrdi_epi32(i16 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shrdi_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdd $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shrdi_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdd $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <16 x i32>
  %1 = bitcast <8 x i64> %__B to <16 x i32>
  %2 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshrd.d.512(<16 x i32> %0, <16 x i32> %1, i32 63, <16 x i32> zeroinitializer, i16 %__U)
  %3 = bitcast <16 x i32> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_shrdi_epi32(<8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shrdi_epi32:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshrdd $31, %zmm1, %zmm0, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__A to <16 x i32>
  %1 = bitcast <8 x i64> %__B to <16 x i32>
  %2 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshrd.d.512(<16 x i32> %0, <16 x i32> %1, i32 31, <16 x i32> zeroinitializer, i16 -1)
  %3 = bitcast <16 x i32> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_mask_shrdi_epi16(<8 x i64> %__S, i32 %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shrdi_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdw $127, %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shrdi_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdw $127, %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <32 x i16>
  %1 = bitcast <8 x i64> %__B to <32 x i16>
  %2 = bitcast <8 x i64> %__S to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshrd.w.512(<32 x i16> %0, <32 x i16> %1, i32 127, <32 x i16> %2, i32 %__U)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

declare <32 x i16> @llvm.x86.avx512.mask.vpshrd.w.512(<32 x i16>, <32 x i16>, i32, <32 x i16>, i32)

define <8 x i64> @test_mm512_maskz_shrdi_epi16(i32 %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shrdi_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdw $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shrdi_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdw $63, %zmm1, %zmm0, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__A to <32 x i16>
  %1 = bitcast <8 x i64> %__B to <32 x i16>
  %2 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshrd.w.512(<32 x i16> %0, <32 x i16> %1, i32 63, <32 x i16> zeroinitializer, i32 %__U)
  %3 = bitcast <32 x i16> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_shrdi_epi16(<8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shrdi_epi16:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshrdw $31, %zmm1, %zmm0, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__A to <32 x i16>
  %1 = bitcast <8 x i64> %__B to <32 x i16>
  %2 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshrd.w.512(<32 x i16> %0, <32 x i16> %1, i32 31, <32 x i16> zeroinitializer, i32 -1)
  %3 = bitcast <32 x i16> %2 to <8 x i64>
  ret <8 x i64> %3
}

define <8 x i64> @test_mm512_mask_shldv_epi64(<8 x i64> %__S, i8 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shldv_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshldvq %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shldv_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldvq %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshldv.q.512(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B, i8 %__U)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_maskz_shldv_epi64(i8 zeroext %__U, <8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shldv_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshldvq %zmm2, %zmm1, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shldv_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldvq %zmm2, %zmm1, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.maskz.vpshldv.q.512(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B, i8 %__U)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_shldv_epi64(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shldv_epi64:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshldvq %zmm2, %zmm1, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshldv.q.512(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B, i8 -1)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_mask_shldv_epi32(<8 x i64> %__S, i16 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shldv_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldvd %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shldv_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldvd %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <16 x i32>
  %1 = bitcast <8 x i64> %__A to <16 x i32>
  %2 = bitcast <8 x i64> %__B to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshldv.d.512(<16 x i32> %0, <16 x i32> %1, <16 x i32> %2, i16 %__U)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_maskz_shldv_epi32(i16 zeroext %__U, <8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shldv_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldvd %zmm2, %zmm1, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shldv_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldvd %zmm2, %zmm1, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <16 x i32>
  %1 = bitcast <8 x i64> %__A to <16 x i32>
  %2 = bitcast <8 x i64> %__B to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.maskz.vpshldv.d.512(<16 x i32> %0, <16 x i32> %1, <16 x i32> %2, i16 %__U)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_shldv_epi32(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shldv_epi32:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshldvd %zmm2, %zmm1, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__S to <16 x i32>
  %1 = bitcast <8 x i64> %__A to <16 x i32>
  %2 = bitcast <8 x i64> %__B to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshldv.d.512(<16 x i32> %0, <16 x i32> %1, <16 x i32> %2, i16 -1)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_mask_shldv_epi16(<8 x i64> %__S, i32 %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shldv_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldvw %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shldv_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldvw %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <32 x i16>
  %1 = bitcast <8 x i64> %__A to <32 x i16>
  %2 = bitcast <8 x i64> %__B to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshldv.w.512(<32 x i16> %0, <32 x i16> %1, <32 x i16> %2, i32 %__U)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_maskz_shldv_epi16(i32 %__U, <8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shldv_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshldvw %zmm2, %zmm1, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shldv_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshldvw %zmm2, %zmm1, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <32 x i16>
  %1 = bitcast <8 x i64> %__A to <32 x i16>
  %2 = bitcast <8 x i64> %__B to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.maskz.vpshldv.w.512(<32 x i16> %0, <32 x i16> %1, <32 x i16> %2, i32 %__U)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_shldv_epi16(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shldv_epi16:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshldvw %zmm2, %zmm1, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__S to <32 x i16>
  %1 = bitcast <8 x i64> %__A to <32 x i16>
  %2 = bitcast <8 x i64> %__B to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshldv.w.512(<32 x i16> %0, <32 x i16> %1, <32 x i16> %2, i32 -1)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_mask_shrdv_epi64(<8 x i64> %__S, i8 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shrdv_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshrdvq %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shrdv_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdvq %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshrdv.q.512(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B, i8 %__U)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_maskz_shrdv_epi64(i8 zeroext %__U, <8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shrdv_epi64:
; X32:       # %bb.0: # %entry
; X32-NEXT:    movb {{[0-9]+}}(%esp), %al
; X32-NEXT:    kmovd %eax, %k1
; X32-NEXT:    vpshrdvq %zmm2, %zmm1, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shrdv_epi64:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdvq %zmm2, %zmm1, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.maskz.vpshrdv.q.512(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B, i8 %__U)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_shrdv_epi64(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shrdv_epi64:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshrdvq %zmm2, %zmm1, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = tail call <8 x i64> @llvm.x86.avx512.mask.vpshrdv.q.512(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B, i8 -1)
  ret <8 x i64> %0
}

define <8 x i64> @test_mm512_mask_shrdv_epi32(<8 x i64> %__S, i16 zeroext %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shrdv_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdvd %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shrdv_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdvd %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <16 x i32>
  %1 = bitcast <8 x i64> %__A to <16 x i32>
  %2 = bitcast <8 x i64> %__B to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshrdv.d.512(<16 x i32> %0, <16 x i32> %1, <16 x i32> %2, i16 %__U)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_maskz_shrdv_epi32(i16 zeroext %__U, <8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shrdv_epi32:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovw {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdvd %zmm2, %zmm1, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shrdv_epi32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdvd %zmm2, %zmm1, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <16 x i32>
  %1 = bitcast <8 x i64> %__A to <16 x i32>
  %2 = bitcast <8 x i64> %__B to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.maskz.vpshrdv.d.512(<16 x i32> %0, <16 x i32> %1, <16 x i32> %2, i16 %__U)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_shrdv_epi32(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shrdv_epi32:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshrdvd %zmm2, %zmm1, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__S to <16 x i32>
  %1 = bitcast <8 x i64> %__A to <16 x i32>
  %2 = bitcast <8 x i64> %__B to <16 x i32>
  %3 = tail call <16 x i32> @llvm.x86.avx512.mask.vpshrdv.d.512(<16 x i32> %0, <16 x i32> %1, <16 x i32> %2, i16 -1)
  %4 = bitcast <16 x i32> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_mask_shrdv_epi16(<8 x i64> %__S, i32 %__U, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_mask_shrdv_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdvw %zmm2, %zmm1, %zmm0 {%k1}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_mask_shrdv_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdvw %zmm2, %zmm1, %zmm0 {%k1}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <32 x i16>
  %1 = bitcast <8 x i64> %__A to <32 x i16>
  %2 = bitcast <8 x i64> %__B to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshrdv.w.512(<32 x i16> %0, <32 x i16> %1, <32 x i16> %2, i32 %__U)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_maskz_shrdv_epi16(i32 %__U, <8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; X32-LABEL: test_mm512_maskz_shrdv_epi16:
; X32:       # %bb.0: # %entry
; X32-NEXT:    kmovd {{[0-9]+}}(%esp), %k1
; X32-NEXT:    vpshrdvw %zmm2, %zmm1, %zmm0 {%k1} {z}
; X32-NEXT:    retl
;
; X64-LABEL: test_mm512_maskz_shrdv_epi16:
; X64:       # %bb.0: # %entry
; X64-NEXT:    kmovd %edi, %k1
; X64-NEXT:    vpshrdvw %zmm2, %zmm1, %zmm0 {%k1} {z}
; X64-NEXT:    retq
entry:
  %0 = bitcast <8 x i64> %__S to <32 x i16>
  %1 = bitcast <8 x i64> %__A to <32 x i16>
  %2 = bitcast <8 x i64> %__B to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.maskz.vpshrdv.w.512(<32 x i16> %0, <32 x i16> %1, <32 x i16> %2, i32 %__U)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

define <8 x i64> @test_mm512_shrdv_epi16(<8 x i64> %__S, <8 x i64> %__A, <8 x i64> %__B) {
; ALL-LABEL: test_mm512_shrdv_epi16:
; ALL:       # %bb.0: # %entry
; ALL-NEXT:    vpshrdvw %zmm2, %zmm1, %zmm0
; ALL-NEXT:    ret{{[l|q]}}
entry:
  %0 = bitcast <8 x i64> %__S to <32 x i16>
  %1 = bitcast <8 x i64> %__A to <32 x i16>
  %2 = bitcast <8 x i64> %__B to <32 x i16>
  %3 = tail call <32 x i16> @llvm.x86.avx512.mask.vpshrdv.w.512(<32 x i16> %0, <32 x i16> %1, <32 x i16> %2, i32 -1)
  %4 = bitcast <32 x i16> %3 to <8 x i64>
  ret <8 x i64> %4
}

declare <32 x i16> @llvm.x86.avx512.mask.compress.w.512(<32 x i16>, <32 x i16>, i32)
declare <64 x i8> @llvm.x86.avx512.mask.compress.b.512(<64 x i8>, <64 x i8>, i64)
declare void @llvm.x86.avx512.mask.compress.store.w.512(i8*, <32 x i16>, i32)
declare void @llvm.x86.avx512.mask.compress.store.b.512(i8*, <64 x i8>, i64)
declare <32 x i16> @llvm.x86.avx512.mask.expand.w.512(<32 x i16>, <32 x i16>, i32)
declare <64 x i8> @llvm.x86.avx512.mask.expand.b.512(<64 x i8>, <64 x i8>, i64)
declare <32 x i16> @llvm.x86.avx512.mask.expand.load.w.512(i8*, <32 x i16>, i32)
declare <64 x i8> @llvm.x86.avx512.mask.expand.load.b.512(i8*, <64 x i8>, i64)
declare <8 x i64> @llvm.x86.avx512.mask.vpshldv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)
declare <8 x i64> @llvm.x86.avx512.maskz.vpshldv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)
declare <16 x i32> @llvm.x86.avx512.mask.vpshldv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)
declare <16 x i32> @llvm.x86.avx512.maskz.vpshldv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)
declare <32 x i16> @llvm.x86.avx512.mask.vpshldv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)
declare <32 x i16> @llvm.x86.avx512.maskz.vpshldv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)
declare <8 x i64> @llvm.x86.avx512.mask.vpshrdv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)
declare <8 x i64> @llvm.x86.avx512.maskz.vpshrdv.q.512(<8 x i64>, <8 x i64>, <8 x i64>, i8)
declare <16 x i32> @llvm.x86.avx512.mask.vpshrdv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)
declare <16 x i32> @llvm.x86.avx512.maskz.vpshrdv.d.512(<16 x i32>, <16 x i32>, <16 x i32>, i16)
declare <32 x i16> @llvm.x86.avx512.mask.vpshrdv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)
declare <32 x i16> @llvm.x86.avx512.maskz.vpshrdv.w.512(<32 x i16>, <32 x i16>, <32 x i16>, i32)