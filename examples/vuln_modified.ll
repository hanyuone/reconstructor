; ModuleID = 'lifted_code'
source_filename = "lifted_code"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu-elf"

%struct.State = type { %struct.X86State }
%struct.X86State = type { %struct.ArchState, [32 x %union.VectorReg], %struct.ArithFlags, %union.anon, %struct.Segments, %struct.AddressSpace, %struct.GPR, %struct.X87Stack, %struct.MMX, %struct.FPUStatusFlags, %union.anon, %union.FPU, %struct.SegmentCaches, %struct.K_REG }
%struct.ArchState = type { i32, i32, %union.anon }
%union.VectorReg = type { %union.vec512_t }
%union.vec512_t = type { %struct.uint64v8_t }
%struct.uint64v8_t = type { [8 x i64] }
%struct.ArithFlags = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }
%struct.Segments = type { i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector, i16, %union.SegmentSelector }
%union.SegmentSelector = type { i16 }
%struct.AddressSpace = type { i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg }
%struct.Reg = type { %union.anon }
%struct.GPR = type { i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg, i64, %struct.Reg }
%struct.X87Stack = type { [8 x %struct.anon.3] }
%struct.anon.3 = type { [6 x i8], %struct.float80_t }
%struct.float80_t = type { [10 x i8] }
%struct.MMX = type { [8 x %struct.anon.4] }
%struct.anon.4 = type { i64, %union.vec64_t }
%union.vec64_t = type { %struct.uint64v1_t }
%struct.uint64v1_t = type { [1 x i64] }
%struct.FPUStatusFlags = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, [4 x i8] }
%union.anon = type { i64 }
%union.FPU = type { %struct.anon.13 }
%struct.anon.13 = type { %struct.FpuFXSAVE, [96 x i8] }
%struct.FpuFXSAVE = type { %union.SegmentSelector, %union.SegmentSelector, %union.FPUAbridgedTagWord, i8, i16, i32, %union.SegmentSelector, i16, i32, %union.SegmentSelector, i16, %union.FPUControlStatus, %union.FPUControlStatus, [8 x %struct.FPUStackElem], [16 x %union.vec128_t] }
%union.FPUAbridgedTagWord = type { i8 }
%union.FPUControlStatus = type { i32 }
%struct.FPUStackElem = type { %union.anon.11, [6 x i8] }
%union.anon.11 = type { %struct.float80_t }
%union.vec128_t = type { %struct.uint128v1_t }
%struct.uint128v1_t = type { [1 x i128] }
%struct.SegmentCaches = type { %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow, %struct.SegmentShadow }
%struct.SegmentShadow = type { %union.anon, i32, i32 }
%struct.K_REG = type { [8 x %struct.anon.18] }
%struct.anon.18 = type { i64, i64 }

@LIFTED.STATE = thread_local(initialexec) global %struct.State zeroinitializer

define ptr @LIFTED.main(ptr noalias %state, i64 %program_counter, ptr noalias %memory) {
  %RSI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 9, i32 0, i32 0
  %RDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
  %RDI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 11, i32 0, i32 0
  %EAX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0
  %FSBASE = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 5, i32 7, i32 0, i32 0
  %RAX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0
  %RSP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 13, i32 0, i32 0
  %RBP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 15, i32 0, i32 0
  %EDI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 11, i32 0, i32 0
  %EDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
  %BRANCH_TAKEN = alloca i8, align 1
  %RETURN_PC = alloca i64, align 8
  %MONITOR = alloca i64, align 8
  %STATE = alloca ptr, align 8
  store ptr %state, ptr %STATE, align 8
  %MEMORY = alloca ptr, align 8
  store ptr %memory, ptr %MEMORY, align 8
  %NEXT_PC = alloca i64, align 8
  store i64 %program_counter, ptr %NEXT_PC, align 8
  %PC = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 33, i32 0, i32 0
  %CSBASE = alloca i64, align 8
  store i64 0, ptr %CSBASE, align 8
  %SSBASE = alloca i64, align 8
  store i64 0, ptr %SSBASE, align 8
  %ESBASE = alloca i64, align 8
  store i64 0, ptr %ESBASE, align 8
  %DSBASE = alloca i64, align 8
  store i64 0, ptr %DSBASE, align 8
  store i64 %program_counter, ptr %NEXT_PC, align 8
  br label %1

1:                                                ; preds = %0
  %2 = load i64, ptr %NEXT_PC, align 8
  store i64 %2, ptr %PC, align 8
  %3 = add i64 %2, 4
  store i64 %3, ptr %NEXT_PC, align 8
  %4 = load i32, ptr %EDX, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32, ptr %EDI, align 4
  %7 = zext i32 %6 to i64
  %8 = load ptr, ptr %MEMORY, align 8
  store ptr %8, ptr %MEMORY, align 8
  br label %9

9:                                                ; preds = %1
  %10 = load i64, ptr %NEXT_PC, align 8
  store i64 %10, ptr %PC, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr %NEXT_PC, align 8
  %12 = load i64, ptr %RBP, align 8
  %13 = load ptr, ptr %MEMORY, align 8
  %14 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %15 = load i64, ptr %14, align 8
  %16 = add i64 %15, -8
  %17 = call ptr @__remill_write_memory_64(ptr noundef %13, i64 noundef %16, i64 noundef %12) #3
  store i64 %16, ptr %14, align 8
  store ptr %17, ptr %MEMORY, align 8
  br label %18

18:                                               ; preds = %9
  %19 = load i64, ptr %NEXT_PC, align 8
  store i64 %19, ptr %PC, align 8
  %20 = add i64 %19, 3
  store i64 %20, ptr %NEXT_PC, align 8
  %21 = load i64, ptr %RSP, align 8
  %22 = load ptr, ptr %MEMORY, align 8
  store i64 %21, ptr %RBP, align 8
  store ptr %22, ptr %MEMORY, align 8
  br label %23

23:                                               ; preds = %18
  %24 = load i64, ptr %NEXT_PC, align 8
  store i64 %24, ptr %PC, align 8
  %25 = add i64 %24, 4
  store i64 %25, ptr %NEXT_PC, align 8
  %26 = load i64, ptr %RSP, align 8
  %27 = load ptr, ptr %MEMORY, align 8
  %28 = sub i64 %26, 48
  store i64 %28, ptr %RSP, align 8
  %29 = icmp ult i64 %26, 48
  %30 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %29, i64 noundef %26, i64 noundef 48, i64 noundef %28) #3
  %31 = zext i1 %30 to i8
  %32 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %31, ptr %32, align 1
  %33 = trunc i64 %28 to i8
  %34 = call i8 @llvm.ctpop.i8(i8 %33)
  %35 = and i8 %34, 1
  %36 = xor i8 %35, 1
  %37 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %36, ptr %37, align 1
  %38 = xor i64 48, %26
  %39 = xor i64 %38, %28
  %40 = trunc i64 %39 to i8
  %41 = lshr i8 %40, 4
  %42 = and i8 %41, 1
  %43 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %42, ptr %43, align 1
  %44 = icmp eq i64 %26, 48
  %45 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %44, i64 noundef %26, i64 noundef 48, i64 noundef %28) #3
  %46 = zext i1 %45 to i8
  %47 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %46, ptr %47, align 1
  %48 = icmp slt i64 %28, 0
  %49 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %48, i64 noundef %26, i64 noundef 48, i64 noundef %28) #3
  %50 = zext i1 %49 to i8
  %51 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %50, ptr %51, align 1
  %52 = lshr i64 %38, 63
  %53 = xor i64 %28, %26
  %54 = lshr i64 %53, 63
  %55 = add nuw nsw i64 %54, %52
  %56 = icmp eq i64 %55, 2
  %57 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %56, i64 noundef %26, i64 noundef 48, i64 noundef %28) #3
  %58 = zext i1 %57 to i8
  %59 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %58, ptr %59, align 1
  store ptr %27, ptr %MEMORY, align 8
  br label %60

60:                                               ; preds = %23
  %61 = load i64, ptr %NEXT_PC, align 8
  store i64 %61, ptr %PC, align 8
  %62 = add i64 %61, 9
  store i64 %62, ptr %NEXT_PC, align 8
  %63 = load i64, ptr %FSBASE, align 8
  %64 = add i64 40, %63
  %65 = load ptr, ptr %MEMORY, align 8
  %66 = call i64 @__remill_read_memory_64(ptr noundef %65, i64 noundef %64) #3
  store i64 %66, ptr %RAX, align 8
  store ptr %65, ptr %MEMORY, align 8
  br label %67

67:                                               ; preds = %60
  %68 = load i64, ptr %NEXT_PC, align 8
  store i64 %68, ptr %PC, align 8
  %69 = add i64 %68, 4
  store i64 %69, ptr %NEXT_PC, align 8
  %70 = load i64, ptr %RBP, align 8
  %71 = sub i64 %70, 8
  %72 = load i64, ptr %RAX, align 8
  %73 = load ptr, ptr %MEMORY, align 8
  %74 = call ptr @__remill_write_memory_64(ptr noundef %73, i64 noundef %71, i64 noundef %72) #3
  store ptr %74, ptr %MEMORY, align 8
  br label %75

75:                                               ; preds = %67
  %76 = load i64, ptr %NEXT_PC, align 8
  store i64 %76, ptr %PC, align 8
  %77 = add i64 %76, 2
  store i64 %77, ptr %NEXT_PC, align 8
  %78 = load i64, ptr %RAX, align 8
  %79 = load i32, ptr %EAX, align 4
  %80 = zext i32 %79 to i64
  %81 = load ptr, ptr %MEMORY, align 8
  %82 = trunc i64 %78 to i32
  %83 = xor i32 %79, %82
  %84 = zext i32 %83 to i64
  store i64 %84, ptr %RAX, align 8
  %85 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %85, align 1
  %86 = trunc i32 %83 to i8
  %87 = call i8 @llvm.ctpop.i8(i8 %86)
  %88 = and i8 %87, 1
  %89 = xor i8 %88, 1
  %90 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %89, ptr %90, align 1
  %91 = icmp eq i32 %83, 0
  %92 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %91, i32 noundef %82, i32 noundef %79, i32 noundef %83) #3
  %93 = zext i1 %92 to i8
  %94 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %93, ptr %94, align 1
  %95 = icmp slt i32 %83, 0
  %96 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %95, i32 noundef %82, i32 noundef %79, i32 noundef %83) #3
  %97 = zext i1 %96 to i8
  %98 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %97, ptr %98, align 1
  %99 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %99, align 1
  %100 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %100, align 1
  %101 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %101, ptr %100, align 1
  store ptr %81, ptr %MEMORY, align 8
  br label %102

102:                                              ; preds = %75
  %103 = load i64, ptr %NEXT_PC, align 8
  store i64 %103, ptr %PC, align 8
  %104 = add i64 %103, 7
  store i64 %104, ptr %NEXT_PC, align 8
  %105 = load i64, ptr %RBP, align 8
  %106 = sub i64 %105, 16
  %107 = load ptr, ptr %MEMORY, align 8
  %108 = call ptr @__remill_write_memory_32(ptr noundef %107, i64 noundef %106, i32 noundef 0) #3
  store ptr %108, ptr %MEMORY, align 8
  br label %109

109:                                              ; preds = %102
  %110 = load i64, ptr %NEXT_PC, align 8
  store i64 %110, ptr %PC, align 8
  %111 = add i64 %110, 7
  store i64 %111, ptr %NEXT_PC, align 8
  %112 = load i64, ptr %RBP, align 8
  %113 = sub i64 %112, 36
  %114 = load ptr, ptr %MEMORY, align 8
  %115 = call ptr @__remill_write_memory_32(ptr noundef %114, i64 noundef %113, i32 noundef 0) #3
  store ptr %115, ptr %MEMORY, align 8
  br label %116

116:                                              ; preds = %109
  %117 = load i64, ptr %NEXT_PC, align 8
  store i64 %117, ptr %PC, align 8
  %118 = add i64 %117, 2
  store i64 %118, ptr %NEXT_PC, align 8
  %119 = load i64, ptr %NEXT_PC, align 8
  %120 = add i64 %119, 63
  %121 = load ptr, ptr %MEMORY, align 8
  %122 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %120, ptr %122, align 8
  store i64 %120, ptr %NEXT_PC, align 8
  store ptr %121, ptr %MEMORY, align 8
  br label %123

123:                                              ; preds = %301, %116
  %124 = load i64, ptr %NEXT_PC, align 8
  store i64 %124, ptr %PC, align 8
  %125 = add i64 %124, 4
  store i64 %125, ptr %NEXT_PC, align 8
  %126 = load i64, ptr %RBP, align 8
  %127 = sub i64 %126, 36
  %128 = load ptr, ptr %MEMORY, align 8
  %129 = call i32 @__remill_read_memory_32(ptr noundef %128, i64 noundef %127) #3
  %cmp.0 = icmp sle i32 %129, 3
  store ptr %128, ptr %MEMORY, align 8

  %130 = load i64, ptr %NEXT_PC, align 8
  store i64 %130, ptr %PC, align 8
  %131 = add i64 %130, 2
  store i64 %131, ptr %NEXT_PC, align 8
  %132 = load i64, ptr %NEXT_PC, align 8
  %133 = sub i64 %132, 69
  %134 = load i64, ptr %NEXT_PC, align 8
  %135 = load ptr, ptr %MEMORY, align 8
  %136 = call zeroext i1 @__remill_compare_sle(i1 noundef zeroext %cmp.0) #4
  %137 = select i1 %cmp.0, i64 %133, i64 %134
  store i64 %137, ptr %NEXT_PC, align 8
  store ptr %135, ptr %MEMORY, align 8
  br i1 %cmp.0, label %138, label %144

138:                                              ; preds = %162
  %139 = load i64, ptr %NEXT_PC, align 8
  store i64 %139, ptr %PC, align 8
  %140 = add i64 %139, 7
  store i64 %140, ptr %NEXT_PC, align 8
  %141 = load i64, ptr %NEXT_PC, align 8
  %142 = add i64 %141, 3657
  %143 = load ptr, ptr %MEMORY, align 8
  store i64 %142, ptr %RAX, align 8
  store ptr %143, ptr %MEMORY, align 8
  br label %152

144:                                              ; preds = %162
  %145 = load i64, ptr %NEXT_PC, align 8
  store i64 %145, ptr %PC, align 8
  %146 = add i64 %145, 3
  store i64 %146, ptr %NEXT_PC, align 8
  %147 = load i64, ptr %RBP, align 8
  %148 = sub i64 %147, 16
  %149 = load ptr, ptr %MEMORY, align 8
  %150 = call i32 @__remill_read_memory_32(ptr noundef %149, i64 noundef %148) #3
  %151 = zext i32 %150 to i64
  store i64 %151, ptr %RAX, align 8
  store ptr %149, ptr %MEMORY, align 8
  br label %345

152:                                              ; preds = %138
  %153 = load i64, ptr %NEXT_PC, align 8
  store i64 %153, ptr %PC, align 8
  %154 = add i64 %153, 3
  store i64 %154, ptr %NEXT_PC, align 8
  %155 = load i64, ptr %RAX, align 8
  %156 = load ptr, ptr %MEMORY, align 8
  store i64 %155, ptr %RDI, align 8
  store ptr %156, ptr %MEMORY, align 8
  br label %157

157:                                              ; preds = %152
  %158 = load i64, ptr %NEXT_PC, align 8
  store i64 %158, ptr %PC, align 8
  %159 = add i64 %158, 5
  store i64 %159, ptr %NEXT_PC, align 8
  %160 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %160, ptr %MEMORY, align 8
  br label %161

161:                                              ; preds = %157
  %162 = load i64, ptr %NEXT_PC, align 8
  store i64 %162, ptr %PC, align 8
  %163 = add i64 %162, 5
  store i64 %163, ptr %NEXT_PC, align 8
  %164 = load i64, ptr %NEXT_PC, align 8
  %165 = sub i64 %164, 328
  %166 = load i64, ptr %NEXT_PC, align 8
  %167 = load ptr, ptr %MEMORY, align 8
  %168 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %169 = load i64, ptr %168, align 8
  %170 = add i64 %169, -8
  %171 = call ptr @__remill_write_memory_64(ptr noundef %167, i64 noundef %170, i64 noundef %166) #3
  store i64 %170, ptr %168, align 8
  %172 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %165, ptr %172, align 8
  store i64 %165, ptr %NEXT_PC, align 8
  store i64 %166, ptr %RETURN_PC, align 8
  store ptr %171, ptr %MEMORY, align 8
  %173 = load ptr, ptr %MEMORY, align 8
  %174 = load i64, ptr %PC, align 8
  %175 = call ptr @EXTERNAL.printf(ptr %state, i64 %174, ptr %173)
  %176 = load i64, ptr %RETURN_PC, align 8
  store i64 %176, ptr %NEXT_PC, align 8
  br label %177

177:                                              ; preds = %161
  %178 = load i64, ptr %NEXT_PC, align 8
  store i64 %178, ptr %PC, align 8
  %179 = add i64 %178, 4
  store i64 %179, ptr %NEXT_PC, align 8
  %180 = load i64, ptr %RBP, align 8
  %181 = sub i64 %180, 32
  %182 = load ptr, ptr %MEMORY, align 8
  store i64 %181, ptr %RDX, align 8
  store ptr %182, ptr %MEMORY, align 8
  br label %183

183:                                              ; preds = %177
  %184 = load i64, ptr %NEXT_PC, align 8
  store i64 %184, ptr %PC, align 8
  %185 = add i64 %184, 3
  store i64 %185, ptr %NEXT_PC, align 8
  %186 = load i64, ptr %RBP, align 8
  %187 = sub i64 %186, 36
  %188 = load ptr, ptr %MEMORY, align 8
  %189 = call i32 @__remill_read_memory_32(ptr noundef %188, i64 noundef %187) #3
  %190 = zext i32 %189 to i64
  store i64 %190, ptr %RAX, align 8
  store ptr %188, ptr %MEMORY, align 8
  br label %191

191:                                              ; preds = %183
  %192 = load i64, ptr %NEXT_PC, align 8
  store i64 %192, ptr %PC, align 8
  %193 = add i64 %192, 2
  store i64 %193, ptr %NEXT_PC, align 8
  %194 = load ptr, ptr %MEMORY, align 8
  %195 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 1
  %196 = load i32, ptr %195, align 8
  %197 = sext i32 %196 to i64
  store i64 %197, ptr %195, align 8
  store ptr %194, ptr %MEMORY, align 8
  br label %198

198:                                              ; preds = %191
  %199 = load i64, ptr %NEXT_PC, align 8
  store i64 %199, ptr %PC, align 8
  %200 = add i64 %199, 4
  store i64 %200, ptr %NEXT_PC, align 8
  %201 = load i64, ptr %RAX, align 8
  %202 = load ptr, ptr %MEMORY, align 8
  %203 = shl i64 %201, 1
  %204 = call zeroext i8 @__remill_undefined_8() #4
  %205 = icmp ne i8 %204, 0
  %206 = shl i64 %203, 1
  store i64 %206, ptr %RAX, align 8
  %207 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  %208 = lshr i64 %203, 63
  %209 = trunc i64 %208 to i8
  store i8 %209, ptr %207, align 1
  %210 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  %211 = trunc i64 %206 to i8
  %212 = call i8 @llvm.ctpop.i8(i8 %211)
  %213 = and i8 %212, 1
  %214 = xor i8 %213, 1
  store i8 %214, ptr %210, align 1
  %215 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  %216 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %216, ptr %215, align 1
  %217 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %218 = icmp eq i64 %206, 0
  %219 = zext i1 %218 to i8
  store i8 %219, ptr %217, align 1
  %220 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  %221 = lshr i64 %206, 63
  %222 = trunc i64 %221 to i8
  store i8 %222, ptr %220, align 1
  %223 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  %224 = zext i1 %205 to i8
  store i8 %224, ptr %223, align 1
  store ptr %202, ptr %MEMORY, align 8
  br label %225

225:                                              ; preds = %198
  %226 = load i64, ptr %NEXT_PC, align 8
  store i64 %226, ptr %PC, align 8
  %227 = add i64 %226, 3
  store i64 %227, ptr %NEXT_PC, align 8
  %228 = load i64, ptr %RAX, align 8
  %229 = load i64, ptr %RDX, align 8
  %230 = load ptr, ptr %MEMORY, align 8
  %231 = add i64 %229, %228
  store i64 %231, ptr %RAX, align 8
  %232 = icmp ult i64 %231, %228
  %233 = icmp ult i64 %231, %229
  %234 = or i1 %232, %233
  %235 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %234, i64 noundef %228, i64 noundef %229, i64 noundef %231) #3
  %236 = zext i1 %235 to i8
  %237 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %236, ptr %237, align 1
  %238 = trunc i64 %231 to i8
  %239 = call i8 @llvm.ctpop.i8(i8 %238)
  %240 = and i8 %239, 1
  %241 = xor i8 %240, 1
  %242 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %241, ptr %242, align 1
  %243 = xor i64 %231, %228
  %244 = xor i64 %243, %229
  %245 = trunc i64 %244 to i8
  %246 = lshr i8 %245, 4
  %247 = and i8 %246, 1
  %248 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %247, ptr %248, align 1
  %249 = icmp eq i64 %231, 0
  %250 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %249, i64 noundef %228, i64 noundef %229, i64 noundef %231) #3
  %251 = zext i1 %250 to i8
  %252 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %251, ptr %252, align 1
  %253 = icmp slt i64 %231, 0
  %254 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %253, i64 noundef %228, i64 noundef %229, i64 noundef %231) #3
  %255 = zext i1 %254 to i8
  %256 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %255, ptr %256, align 1
  %257 = lshr i64 %243, 63
  %258 = xor i64 %231, %229
  %259 = lshr i64 %258, 63
  %260 = add nuw nsw i64 %257, %259
  %261 = icmp eq i64 %260, 2
  %262 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %261, i64 noundef %228, i64 noundef %229, i64 noundef %231) #3
  %263 = zext i1 %262 to i8
  %264 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %263, ptr %264, align 1
  store ptr %230, ptr %MEMORY, align 8
  br label %265

265:                                              ; preds = %225
  %266 = load i64, ptr %NEXT_PC, align 8
  store i64 %266, ptr %PC, align 8
  %267 = add i64 %266, 3
  store i64 %267, ptr %NEXT_PC, align 8
  %268 = load i64, ptr %RAX, align 8
  %269 = load ptr, ptr %MEMORY, align 8
  store i64 %268, ptr %RSI, align 8
  store ptr %269, ptr %MEMORY, align 8
  br label %270

270:                                              ; preds = %265
  %271 = load i64, ptr %NEXT_PC, align 8
  store i64 %271, ptr %PC, align 8
  %272 = add i64 %271, 7
  store i64 %272, ptr %NEXT_PC, align 8
  %273 = load i64, ptr %NEXT_PC, align 8
  %274 = add i64 %273, 3622
  %275 = load ptr, ptr %MEMORY, align 8
  store i64 %274, ptr %RAX, align 8
  store ptr %275, ptr %MEMORY, align 8
  br label %276

276:                                              ; preds = %270
  %277 = load i64, ptr %NEXT_PC, align 8
  store i64 %277, ptr %PC, align 8
  %278 = add i64 %277, 3
  store i64 %278, ptr %NEXT_PC, align 8
  %279 = load i64, ptr %RAX, align 8
  %280 = load ptr, ptr %MEMORY, align 8
  store i64 %279, ptr %RDI, align 8
  store ptr %280, ptr %MEMORY, align 8
  br label %281

281:                                              ; preds = %276
  %282 = load i64, ptr %NEXT_PC, align 8
  store i64 %282, ptr %PC, align 8
  %283 = add i64 %282, 5
  store i64 %283, ptr %NEXT_PC, align 8
  %284 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %284, ptr %MEMORY, align 8
  br label %285

285:                                              ; preds = %281
  %286 = load i64, ptr %NEXT_PC, align 8
  store i64 %286, ptr %PC, align 8
  %287 = add i64 %286, 5
  store i64 %287, ptr %NEXT_PC, align 8
  %288 = load i64, ptr %NEXT_PC, align 8
  %289 = sub i64 %288, 351
  %290 = load i64, ptr %NEXT_PC, align 8
  %291 = load ptr, ptr %MEMORY, align 8
  %292 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %293 = load i64, ptr %292, align 8
  %294 = add i64 %293, -8
  %295 = call ptr @__remill_write_memory_64(ptr noundef %291, i64 noundef %294, i64 noundef %290) #3
  store i64 %294, ptr %292, align 8
  %296 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %289, ptr %296, align 8
  store i64 %289, ptr %NEXT_PC, align 8
  store i64 %290, ptr %RETURN_PC, align 8
  store ptr %295, ptr %MEMORY, align 8
  %297 = load ptr, ptr %MEMORY, align 8
  %298 = load i64, ptr %PC, align 8
  %299 = call ptr @EXTERNAL.__isoc99_scanf(ptr %state, i64 %298, ptr %297)
  %300 = load i64, ptr %RETURN_PC, align 8
  store i64 %300, ptr %NEXT_PC, align 8
  br label %301

301:                                              ; preds = %285
  %302 = load i64, ptr %NEXT_PC, align 8
  store i64 %302, ptr %PC, align 8
  %303 = add i64 %302, 4
  store i64 %303, ptr %NEXT_PC, align 8
  %304 = load i64, ptr %RBP, align 8
  %305 = sub i64 %304, 36
  %306 = load i64, ptr %RBP, align 8
  %307 = sub i64 %306, 36
  %308 = load ptr, ptr %MEMORY, align 8
  %309 = call i32 @__remill_read_memory_32(ptr noundef %308, i64 noundef %307) #3
  %310 = add i32 %309, 1
  %311 = call ptr @__remill_write_memory_32(ptr noundef %308, i64 noundef %305, i32 noundef %310) #3
  %312 = icmp ult i32 %310, %309
  %313 = icmp ult i32 %310, 1
  %314 = or i1 %312, %313
  %315 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %314, i32 noundef %309, i32 noundef 1, i32 noundef %310) #3
  %316 = zext i1 %315 to i8
  %317 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %316, ptr %317, align 1
  %318 = trunc i32 %310 to i8
  %319 = call i8 @llvm.ctpop.i8(i8 %318)
  %320 = and i8 %319, 1
  %321 = xor i8 %320, 1
  %322 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %321, ptr %322, align 1
  %323 = xor i32 %310, %309
  %324 = xor i32 %323, 1
  %325 = trunc i32 %324 to i8
  %326 = lshr i8 %325, 4
  %327 = and i8 %326, 1
  %328 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %327, ptr %328, align 1
  %329 = icmp eq i32 %310, 0
  %330 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %329, i32 noundef %309, i32 noundef 1, i32 noundef %310) #3
  %331 = zext i1 %330 to i8
  %332 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %331, ptr %332, align 1
  %333 = icmp slt i32 %310, 0
  %334 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %333, i32 noundef %309, i32 noundef 1, i32 noundef %310) #3
  %335 = zext i1 %334 to i8
  %336 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %335, ptr %336, align 1
  %337 = lshr i32 %323, 31
  %338 = xor i32 %310, 1
  %339 = lshr i32 %338, 31
  %340 = add nuw nsw i32 %337, %339
  %341 = icmp eq i32 %340, 2
  %342 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %341, i32 noundef %309, i32 noundef 1, i32 noundef %310) #3
  %343 = zext i1 %342 to i8
  %344 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %343, ptr %344, align 1
  store ptr %311, ptr %MEMORY, align 8
  br label %123

345:                                              ; preds = %144
  %346 = load i64, ptr %NEXT_PC, align 8
  store i64 %346, ptr %PC, align 8
  %347 = add i64 %346, 2
  store i64 %347, ptr %NEXT_PC, align 8
  %348 = load i32, ptr %EAX, align 4
  %349 = zext i32 %348 to i64
  %350 = load ptr, ptr %MEMORY, align 8
  %cmp.1 = icmp sle i32 %348, 0
  store ptr %350, ptr %MEMORY, align 8

  %351 = load i64, ptr %NEXT_PC, align 8
  store i64 %351, ptr %PC, align 8
  %352 = add i64 %351, 2
  store i64 %352, ptr %NEXT_PC, align 8
  %353 = load i64, ptr %NEXT_PC, align 8
  %354 = add i64 %353, 25
  %355 = load i64, ptr %NEXT_PC, align 8
  %356 = load ptr, ptr %MEMORY, align 8
  %357 = call zeroext i1 @__remill_compare_sle(i1 noundef zeroext %cmp.1) #4
  %358 = select i1 %cmp.1, i64 %354, i64 %355
  store i64 %358, ptr %NEXT_PC, align 8
  store ptr %356, ptr %MEMORY, align 8
  br i1 %cmp.1, label %359, label %363

359:                                              ; preds = %393, %370
  %360 = load i64, ptr %NEXT_PC, align 8
  store i64 %360, ptr %PC, align 8
  %361 = add i64 %360, 5
  store i64 %361, ptr %NEXT_PC, align 8
  %362 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %362, ptr %MEMORY, align 8
  br label %409

363:                                              ; preds = %370
  %364 = load i64, ptr %NEXT_PC, align 8
  store i64 %364, ptr %PC, align 8
  %365 = add i64 %364, 3
  store i64 %365, ptr %NEXT_PC, align 8
  %366 = load i64, ptr %RBP, align 8
  %367 = sub i64 %366, 16
  %368 = load ptr, ptr %MEMORY, align 8
  %369 = call i32 @__remill_read_memory_32(ptr noundef %368, i64 noundef %367) #3
  %370 = zext i32 %369 to i64
  store i64 %370, ptr %RAX, align 8
  store ptr %368, ptr %MEMORY, align 8
  br label %371

371:                                              ; preds = %363
  %372 = load i64, ptr %NEXT_PC, align 8
  store i64 %372, ptr %PC, align 8
  %373 = add i64 %372, 2
  store i64 %373, ptr %NEXT_PC, align 8
  %374 = load i32, ptr %EAX, align 4
  %375 = zext i32 %374 to i64
  %376 = load ptr, ptr %MEMORY, align 8
  %377 = and i64 %375, 4294967295
  store i64 %377, ptr %RSI, align 8
  store ptr %376, ptr %MEMORY, align 8
  br label %378

378:                                              ; preds = %371
  %379 = load i64, ptr %NEXT_PC, align 8
  store i64 %379, ptr %PC, align 8
  %380 = add i64 %379, 7
  store i64 %380, ptr %NEXT_PC, align 8
  %381 = load i64, ptr %NEXT_PC, align 8
  %382 = add i64 %381, 3586
  %383 = load ptr, ptr %MEMORY, align 8
  store i64 %382, ptr %RAX, align 8
  store ptr %383, ptr %MEMORY, align 8
  br label %384

384:                                              ; preds = %378
  %385 = load i64, ptr %NEXT_PC, align 8
  store i64 %385, ptr %PC, align 8
  %386 = add i64 %385, 3
  store i64 %386, ptr %NEXT_PC, align 8
  %387 = load i64, ptr %RAX, align 8
  %388 = load ptr, ptr %MEMORY, align 8
  store i64 %387, ptr %RDI, align 8
  store ptr %388, ptr %MEMORY, align 8
  br label %389

389:                                              ; preds = %384
  %390 = load i64, ptr %NEXT_PC, align 8
  store i64 %390, ptr %PC, align 8
  %391 = add i64 %390, 5
  store i64 %391, ptr %NEXT_PC, align 8
  %392 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %392, ptr %MEMORY, align 8
  br label %393

393:                                              ; preds = %389
  %394 = load i64, ptr %NEXT_PC, align 8
  store i64 %394, ptr %PC, align 8
  %395 = add i64 %394, 5
  store i64 %395, ptr %NEXT_PC, align 8
  %396 = load i64, ptr %NEXT_PC, align 8
  %397 = sub i64 %396, 409
  %398 = load i64, ptr %NEXT_PC, align 8
  %399 = load ptr, ptr %MEMORY, align 8
  %400 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %401 = load i64, ptr %400, align 8
  %402 = add i64 %401, -8
  %403 = call ptr @__remill_write_memory_64(ptr noundef %399, i64 noundef %402, i64 noundef %398) #3
  store i64 %402, ptr %400, align 8
  %404 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %397, ptr %404, align 8
  store i64 %397, ptr %NEXT_PC, align 8
  store i64 %398, ptr %RETURN_PC, align 8
  store ptr %403, ptr %MEMORY, align 8
  %405 = load ptr, ptr %MEMORY, align 8
  %406 = load i64, ptr %PC, align 8
  %407 = call ptr @EXTERNAL.printf(ptr %state, i64 %406, ptr %405)
  %408 = load i64, ptr %RETURN_PC, align 8
  store i64 %408, ptr %NEXT_PC, align 8
  br label %359

409:                                              ; preds = %359
  %410 = load i64, ptr %NEXT_PC, align 8
  store i64 %410, ptr %PC, align 8
  %411 = add i64 %410, 4
  store i64 %411, ptr %NEXT_PC, align 8
  %412 = load i64, ptr %RBP, align 8
  %413 = sub i64 %412, 8
  %414 = load ptr, ptr %MEMORY, align 8
  %415 = call i64 @__remill_read_memory_64(ptr noundef %414, i64 noundef %413) #3
  store i64 %415, ptr %RDX, align 8
  store ptr %414, ptr %MEMORY, align 8
  br label %416

416:                                              ; preds = %409
  %417 = load i64, ptr %NEXT_PC, align 8
  store i64 %417, ptr %PC, align 8
  %418 = add i64 %417, 9
  store i64 %418, ptr %NEXT_PC, align 8
  %419 = load i64, ptr %RDX, align 8
  %420 = load i64, ptr %FSBASE, align 8
  %421 = add i64 40, %420
  %422 = load ptr, ptr %MEMORY, align 8
  %423 = call i64 @__remill_read_memory_64(ptr noundef %422, i64 noundef %421) #3
  %424 = sub i64 %419, %423
  store i64 %424, ptr %RDX, align 8
  %cmp.2 = icmp eq i64 %424, 0
  store ptr %422, ptr %MEMORY, align 8

  %425 = load i64, ptr %NEXT_PC, align 8
  store i64 %425, ptr %PC, align 8
  %426 = add i64 %425, 2
  store i64 %426, ptr %NEXT_PC, align 8
  %427 = load i64, ptr %NEXT_PC, align 8
  %428 = add i64 %427, 5
  %429 = load i64, ptr %NEXT_PC, align 8
  %430 = load ptr, ptr %MEMORY, align 8
  %431 = call zeroext i1 @__remill_compare_eq(i1 noundef zeroext %cmp.2) #4
  %432 = select i1 %cmp.2, i64 %428, i64 %429
  store i64 %432, ptr %NEXT_PC, align 8
  store ptr %430, ptr %MEMORY, align 8
  br i1 %cmp.2, label %433, label %442

433:                                              ; preds = %442, %456
  %434 = load i64, ptr %NEXT_PC, align 8
  store i64 %434, ptr %PC, align 8
  %435 = add i64 %434, 1
  store i64 %435, ptr %NEXT_PC, align 8
  %436 = load ptr, ptr %MEMORY, align 8
  %437 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 15
  %438 = load i64, ptr %437, align 8
  %439 = call i64 @__remill_read_memory_64(ptr noundef %436, i64 noundef %438) #3
  store i64 %439, ptr %437, align 8
  %440 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %441 = add i64 %438, 8
  store i64 %441, ptr %440, align 8
  store ptr %436, ptr %MEMORY, align 8
  br label %458

442:                                              ; preds = %456
  %443 = load i64, ptr %NEXT_PC, align 8
  store i64 %443, ptr %PC, align 8
  %444 = add i64 %443, 5
  store i64 %444, ptr %NEXT_PC, align 8
  %445 = load i64, ptr %NEXT_PC, align 8
  %446 = sub i64 %445, 450
  %447 = load i64, ptr %NEXT_PC, align 8
  %448 = load ptr, ptr %MEMORY, align 8
  %449 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %450 = load i64, ptr %449, align 8
  %451 = add i64 %450, -8
  %452 = call ptr @__remill_write_memory_64(ptr noundef %448, i64 noundef %451, i64 noundef %447) #3
  store i64 %451, ptr %449, align 8
  %453 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %446, ptr %453, align 8
  store i64 %446, ptr %NEXT_PC, align 8
  store i64 %447, ptr %RETURN_PC, align 8
  store ptr %452, ptr %MEMORY, align 8
  %454 = load ptr, ptr %MEMORY, align 8
  %455 = load i64, ptr %PC, align 8
  %456 = call ptr @EXTERNAL.__stack_chk_fail(ptr %state, i64 %455, ptr %454)
  %457 = load i64, ptr %RETURN_PC, align 8
  store i64 %457, ptr %NEXT_PC, align 8
  br label %433

458:                                              ; preds = %433
  %459 = load i64, ptr %NEXT_PC, align 8
  store i64 %459, ptr %PC, align 8
  %460 = add i64 %459, 1
  store i64 %460, ptr %NEXT_PC, align 8
  %461 = load ptr, ptr %MEMORY, align 8
  %462 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %463 = load i64, ptr %462, align 8
  %464 = call i64 @__remill_read_memory_64(ptr noundef %461, i64 noundef %463) #3
  %465 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %464, ptr %465, align 8
  store i64 %464, ptr %NEXT_PC, align 8
  %466 = load i64, ptr %462, align 8
  %467 = add i64 %466, 8
  store i64 %467, ptr %462, align 8
  store ptr %461, ptr %MEMORY, align 8
  %468 = load i64, ptr %NEXT_PC, align 8
  store i64 %468, ptr %PC, align 8
  %469 = load ptr, ptr %MEMORY, align 8
  %470 = load i64, ptr %PC, align 8
  %471 = tail call ptr @__remill_function_return(ptr %state, i64 %470, ptr %469)
  ret ptr %471
}

; Function Attrs: noduplicate noinline nounwind optnone
declare ptr @__remill_write_memory_64(ptr noundef, i64 noundef, i64 noundef) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_flag_computation_carry(i1 noundef zeroext, ...) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ctpop.i8(i8) #1

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_flag_computation_zero(i1 noundef zeroext, ...) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_flag_computation_sign(i1 noundef zeroext, ...) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_flag_computation_overflow(i1 noundef zeroext, ...) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare i64 @__remill_read_memory_64(ptr noundef, i64 noundef) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i8 @__remill_undefined_8() #0

; Function Attrs: noduplicate noinline nounwind optnone
declare ptr @__remill_write_memory_32(ptr noundef, i64 noundef, i32 noundef) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare i32 @__remill_read_memory_32(ptr noundef, i64 noundef) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_compare_sle(i1 noundef zeroext) #0

declare ptr @EXTERNAL.printf(ptr, i64, ptr)

declare ptr @EXTERNAL.__isoc99_scanf(ptr, i64, ptr)

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_compare_eq(i1 noundef zeroext) #0

declare ptr @EXTERNAL.__stack_chk_fail(ptr, i64, ptr)

; Function Attrs: noduplicate noinline nounwind optnone
declare ptr @__remill_function_return(ptr noundef nonnull align 1, i64 noundef, ptr noundef) #2

; Function Attrs: noduplicate noinline nounwind optnone
declare ptr @__remill_function_call(ptr noundef nonnull align 1, i64 noundef, ptr noundef) #2

; Function Attrs: noduplicate noinline nounwind optnone
declare ptr @__remill_error(ptr noundef nonnull align 16 dereferenceable(3504), i64 noundef, ptr noundef) #0

define i32 @main() {
  %1 = call ptr @__lifter_init_memory()
  %2 = call ptr @LIFTED.main(ptr @LIFTED.STATE, i64 4489, ptr %1)
  %3 = load i32, ptr getelementptr inbounds (%struct.State, ptr @LIFTED.STATE, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0), align 4
  call void @__lifter_free_memory(ptr %1)
  ret i32 %3
}

declare ptr @__lifter_init_memory()

declare void @__lifter_free_memory(ptr)

attributes #0 = { noduplicate noinline nounwind optnone "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { noduplicate noinline nounwind optnone "frame-pointer"="all" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind "no-builtins" }
attributes #4 = { alwaysinline nobuiltin nounwind "no-builtins" }
