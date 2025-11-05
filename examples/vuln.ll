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

123:                                              ; preds = %348, %116
  %124 = load i64, ptr %NEXT_PC, align 8
  store i64 %124, ptr %PC, align 8
  %125 = add i64 %124, 4
  store i64 %125, ptr %NEXT_PC, align 8
  %126 = load i64, ptr %RBP, align 8
  %127 = sub i64 %126, 36
  %128 = load ptr, ptr %MEMORY, align 8
  %129 = call i32 @__remill_read_memory_32(ptr noundef %128, i64 noundef %127) #3
  %130 = sub i32 %129, 3
  %131 = icmp ult i32 %129, 3
  %132 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %131, i32 noundef %129, i32 noundef 3, i32 noundef %130) #3
  %133 = zext i1 %132 to i8
  %134 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %133, ptr %134, align 1
  %135 = trunc i32 %130 to i8
  %136 = call i8 @llvm.ctpop.i8(i8 %135)
  %137 = and i8 %136, 1
  %138 = xor i8 %137, 1
  %139 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %138, ptr %139, align 1
  %140 = xor i32 %129, 3
  %141 = xor i32 %140, %130
  %142 = trunc i32 %141 to i8
  %143 = lshr i8 %142, 4
  %144 = and i8 %143, 1
  %145 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %144, ptr %145, align 1
  %146 = icmp eq i32 %129, 3
  %147 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %146, i32 noundef %129, i32 noundef 3, i32 noundef %130) #3
  %148 = zext i1 %147 to i8
  %149 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %148, ptr %149, align 1
  %150 = icmp slt i32 %130, 0
  %151 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %150, i32 noundef %129, i32 noundef 3, i32 noundef %130) #3
  %152 = zext i1 %151 to i8
  %153 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %152, ptr %153, align 1
  %154 = lshr i32 %140, 31
  %155 = xor i32 %130, %129
  %156 = lshr i32 %155, 31
  %157 = add nuw nsw i32 %156, %154
  %158 = icmp eq i32 %157, 2
  %159 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %158, i32 noundef %129, i32 noundef 3, i32 noundef %130) #3
  %160 = zext i1 %159 to i8
  %161 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %160, ptr %161, align 1
  store ptr %128, ptr %MEMORY, align 8
  br label %162

162:                                              ; preds = %123
  %163 = load i64, ptr %NEXT_PC, align 8
  store i64 %163, ptr %PC, align 8
  %164 = add i64 %163, 2
  store i64 %164, ptr %NEXT_PC, align 8
  %165 = load i64, ptr %NEXT_PC, align 8
  %166 = sub i64 %165, 69
  %167 = load i64, ptr %NEXT_PC, align 8
  %168 = load ptr, ptr %MEMORY, align 8
  %169 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %170 = load i8, ptr %169, align 1
  %171 = icmp ne i8 %170, 0
  %172 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  %173 = load i8, ptr %172, align 1
  %174 = icmp ne i8 %173, 0
  %175 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  %176 = load i8, ptr %175, align 1
  %177 = icmp ne i8 %176, 0
  %178 = xor i1 %174, %177
  %179 = or i1 %171, %178
  %180 = call zeroext i1 @__remill_compare_sle(i1 noundef zeroext %179) #4
  %181 = zext i1 %180 to i8
  store i8 %181, ptr %BRANCH_TAKEN, align 1
  %182 = select i1 %180, i64 %166, i64 %167
  store i64 %182, ptr %NEXT_PC, align 8
  store ptr %168, ptr %MEMORY, align 8
  %183 = load i8, ptr %BRANCH_TAKEN, align 1
  %184 = icmp eq i8 %183, 1
  br i1 %184, label %185, label %191

185:                                              ; preds = %162
  %186 = load i64, ptr %NEXT_PC, align 8
  store i64 %186, ptr %PC, align 8
  %187 = add i64 %186, 7
  store i64 %187, ptr %NEXT_PC, align 8
  %188 = load i64, ptr %NEXT_PC, align 8
  %189 = add i64 %188, 3657
  %190 = load ptr, ptr %MEMORY, align 8
  store i64 %189, ptr %RAX, align 8
  store ptr %190, ptr %MEMORY, align 8
  br label %199

191:                                              ; preds = %162
  %192 = load i64, ptr %NEXT_PC, align 8
  store i64 %192, ptr %PC, align 8
  %193 = add i64 %192, 3
  store i64 %193, ptr %NEXT_PC, align 8
  %194 = load i64, ptr %RBP, align 8
  %195 = sub i64 %194, 16
  %196 = load ptr, ptr %MEMORY, align 8
  %197 = call i32 @__remill_read_memory_32(ptr noundef %196, i64 noundef %195) #3
  %198 = zext i32 %197 to i64
  store i64 %198, ptr %RAX, align 8
  store ptr %196, ptr %MEMORY, align 8
  br label %392

199:                                              ; preds = %185
  %200 = load i64, ptr %NEXT_PC, align 8
  store i64 %200, ptr %PC, align 8
  %201 = add i64 %200, 3
  store i64 %201, ptr %NEXT_PC, align 8
  %202 = load i64, ptr %RAX, align 8
  %203 = load ptr, ptr %MEMORY, align 8
  store i64 %202, ptr %RDI, align 8
  store ptr %203, ptr %MEMORY, align 8
  br label %204

204:                                              ; preds = %199
  %205 = load i64, ptr %NEXT_PC, align 8
  store i64 %205, ptr %PC, align 8
  %206 = add i64 %205, 5
  store i64 %206, ptr %NEXT_PC, align 8
  %207 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %207, ptr %MEMORY, align 8
  br label %208

208:                                              ; preds = %204
  %209 = load i64, ptr %NEXT_PC, align 8
  store i64 %209, ptr %PC, align 8
  %210 = add i64 %209, 5
  store i64 %210, ptr %NEXT_PC, align 8
  %211 = load i64, ptr %NEXT_PC, align 8
  %212 = sub i64 %211, 328
  %213 = load i64, ptr %NEXT_PC, align 8
  %214 = load ptr, ptr %MEMORY, align 8
  %215 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %216 = load i64, ptr %215, align 8
  %217 = add i64 %216, -8
  %218 = call ptr @__remill_write_memory_64(ptr noundef %214, i64 noundef %217, i64 noundef %213) #3
  store i64 %217, ptr %215, align 8
  %219 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %212, ptr %219, align 8
  store i64 %212, ptr %NEXT_PC, align 8
  store i64 %213, ptr %RETURN_PC, align 8
  store ptr %218, ptr %MEMORY, align 8
  %220 = load ptr, ptr %MEMORY, align 8
  %221 = load i64, ptr %PC, align 8
  %222 = call ptr @EXTERNAL.printf(ptr %state, i64 %221, ptr %220)
  %223 = load i64, ptr %RETURN_PC, align 8
  store i64 %223, ptr %NEXT_PC, align 8
  br label %224

224:                                              ; preds = %208
  %225 = load i64, ptr %NEXT_PC, align 8
  store i64 %225, ptr %PC, align 8
  %226 = add i64 %225, 4
  store i64 %226, ptr %NEXT_PC, align 8
  %227 = load i64, ptr %RBP, align 8
  %228 = sub i64 %227, 32
  %229 = load ptr, ptr %MEMORY, align 8
  store i64 %228, ptr %RDX, align 8
  store ptr %229, ptr %MEMORY, align 8
  br label %230

230:                                              ; preds = %224
  %231 = load i64, ptr %NEXT_PC, align 8
  store i64 %231, ptr %PC, align 8
  %232 = add i64 %231, 3
  store i64 %232, ptr %NEXT_PC, align 8
  %233 = load i64, ptr %RBP, align 8
  %234 = sub i64 %233, 36
  %235 = load ptr, ptr %MEMORY, align 8
  %236 = call i32 @__remill_read_memory_32(ptr noundef %235, i64 noundef %234) #3
  %237 = zext i32 %236 to i64
  store i64 %237, ptr %RAX, align 8
  store ptr %235, ptr %MEMORY, align 8
  br label %238

238:                                              ; preds = %230
  %239 = load i64, ptr %NEXT_PC, align 8
  store i64 %239, ptr %PC, align 8
  %240 = add i64 %239, 2
  store i64 %240, ptr %NEXT_PC, align 8
  %241 = load ptr, ptr %MEMORY, align 8
  %242 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 1
  %243 = load i32, ptr %242, align 8
  %244 = sext i32 %243 to i64
  store i64 %244, ptr %242, align 8
  store ptr %241, ptr %MEMORY, align 8
  br label %245

245:                                              ; preds = %238
  %246 = load i64, ptr %NEXT_PC, align 8
  store i64 %246, ptr %PC, align 8
  %247 = add i64 %246, 4
  store i64 %247, ptr %NEXT_PC, align 8
  %248 = load i64, ptr %RAX, align 8
  %249 = load ptr, ptr %MEMORY, align 8
  %250 = shl i64 %248, 1
  %251 = call zeroext i8 @__remill_undefined_8() #4
  %252 = icmp ne i8 %251, 0
  %253 = shl i64 %250, 1
  store i64 %253, ptr %RAX, align 8
  %254 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  %255 = lshr i64 %250, 63
  %256 = trunc i64 %255 to i8
  store i8 %256, ptr %254, align 1
  %257 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  %258 = trunc i64 %253 to i8
  %259 = call i8 @llvm.ctpop.i8(i8 %258)
  %260 = and i8 %259, 1
  %261 = xor i8 %260, 1
  store i8 %261, ptr %257, align 1
  %262 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  %263 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %263, ptr %262, align 1
  %264 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %265 = icmp eq i64 %253, 0
  %266 = zext i1 %265 to i8
  store i8 %266, ptr %264, align 1
  %267 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  %268 = lshr i64 %253, 63
  %269 = trunc i64 %268 to i8
  store i8 %269, ptr %267, align 1
  %270 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  %271 = zext i1 %252 to i8
  store i8 %271, ptr %270, align 1
  store ptr %249, ptr %MEMORY, align 8
  br label %272

272:                                              ; preds = %245
  %273 = load i64, ptr %NEXT_PC, align 8
  store i64 %273, ptr %PC, align 8
  %274 = add i64 %273, 3
  store i64 %274, ptr %NEXT_PC, align 8
  %275 = load i64, ptr %RAX, align 8
  %276 = load i64, ptr %RDX, align 8
  %277 = load ptr, ptr %MEMORY, align 8
  %278 = add i64 %276, %275
  store i64 %278, ptr %RAX, align 8
  %279 = icmp ult i64 %278, %275
  %280 = icmp ult i64 %278, %276
  %281 = or i1 %279, %280
  %282 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %281, i64 noundef %275, i64 noundef %276, i64 noundef %278) #3
  %283 = zext i1 %282 to i8
  %284 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %283, ptr %284, align 1
  %285 = trunc i64 %278 to i8
  %286 = call i8 @llvm.ctpop.i8(i8 %285)
  %287 = and i8 %286, 1
  %288 = xor i8 %287, 1
  %289 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %288, ptr %289, align 1
  %290 = xor i64 %278, %275
  %291 = xor i64 %290, %276
  %292 = trunc i64 %291 to i8
  %293 = lshr i8 %292, 4
  %294 = and i8 %293, 1
  %295 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %294, ptr %295, align 1
  %296 = icmp eq i64 %278, 0
  %297 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %296, i64 noundef %275, i64 noundef %276, i64 noundef %278) #3
  %298 = zext i1 %297 to i8
  %299 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %298, ptr %299, align 1
  %300 = icmp slt i64 %278, 0
  %301 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %300, i64 noundef %275, i64 noundef %276, i64 noundef %278) #3
  %302 = zext i1 %301 to i8
  %303 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %302, ptr %303, align 1
  %304 = lshr i64 %290, 63
  %305 = xor i64 %278, %276
  %306 = lshr i64 %305, 63
  %307 = add nuw nsw i64 %304, %306
  %308 = icmp eq i64 %307, 2
  %309 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %308, i64 noundef %275, i64 noundef %276, i64 noundef %278) #3
  %310 = zext i1 %309 to i8
  %311 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %310, ptr %311, align 1
  store ptr %277, ptr %MEMORY, align 8
  br label %312

312:                                              ; preds = %272
  %313 = load i64, ptr %NEXT_PC, align 8
  store i64 %313, ptr %PC, align 8
  %314 = add i64 %313, 3
  store i64 %314, ptr %NEXT_PC, align 8
  %315 = load i64, ptr %RAX, align 8
  %316 = load ptr, ptr %MEMORY, align 8
  store i64 %315, ptr %RSI, align 8
  store ptr %316, ptr %MEMORY, align 8
  br label %317

317:                                              ; preds = %312
  %318 = load i64, ptr %NEXT_PC, align 8
  store i64 %318, ptr %PC, align 8
  %319 = add i64 %318, 7
  store i64 %319, ptr %NEXT_PC, align 8
  %320 = load i64, ptr %NEXT_PC, align 8
  %321 = add i64 %320, 3622
  %322 = load ptr, ptr %MEMORY, align 8
  store i64 %321, ptr %RAX, align 8
  store ptr %322, ptr %MEMORY, align 8
  br label %323

323:                                              ; preds = %317
  %324 = load i64, ptr %NEXT_PC, align 8
  store i64 %324, ptr %PC, align 8
  %325 = add i64 %324, 3
  store i64 %325, ptr %NEXT_PC, align 8
  %326 = load i64, ptr %RAX, align 8
  %327 = load ptr, ptr %MEMORY, align 8
  store i64 %326, ptr %RDI, align 8
  store ptr %327, ptr %MEMORY, align 8
  br label %328

328:                                              ; preds = %323
  %329 = load i64, ptr %NEXT_PC, align 8
  store i64 %329, ptr %PC, align 8
  %330 = add i64 %329, 5
  store i64 %330, ptr %NEXT_PC, align 8
  %331 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %331, ptr %MEMORY, align 8
  br label %332

332:                                              ; preds = %328
  %333 = load i64, ptr %NEXT_PC, align 8
  store i64 %333, ptr %PC, align 8
  %334 = add i64 %333, 5
  store i64 %334, ptr %NEXT_PC, align 8
  %335 = load i64, ptr %NEXT_PC, align 8
  %336 = sub i64 %335, 351
  %337 = load i64, ptr %NEXT_PC, align 8
  %338 = load ptr, ptr %MEMORY, align 8
  %339 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %340 = load i64, ptr %339, align 8
  %341 = add i64 %340, -8
  %342 = call ptr @__remill_write_memory_64(ptr noundef %338, i64 noundef %341, i64 noundef %337) #3
  store i64 %341, ptr %339, align 8
  %343 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %336, ptr %343, align 8
  store i64 %336, ptr %NEXT_PC, align 8
  store i64 %337, ptr %RETURN_PC, align 8
  store ptr %342, ptr %MEMORY, align 8
  %344 = load ptr, ptr %MEMORY, align 8
  %345 = load i64, ptr %PC, align 8
  %346 = call ptr @EXTERNAL.__isoc99_scanf(ptr %state, i64 %345, ptr %344)
  %347 = load i64, ptr %RETURN_PC, align 8
  store i64 %347, ptr %NEXT_PC, align 8
  br label %348

348:                                              ; preds = %332
  %349 = load i64, ptr %NEXT_PC, align 8
  store i64 %349, ptr %PC, align 8
  %350 = add i64 %349, 4
  store i64 %350, ptr %NEXT_PC, align 8
  %351 = load i64, ptr %RBP, align 8
  %352 = sub i64 %351, 36
  %353 = load i64, ptr %RBP, align 8
  %354 = sub i64 %353, 36
  %355 = load ptr, ptr %MEMORY, align 8
  %356 = call i32 @__remill_read_memory_32(ptr noundef %355, i64 noundef %354) #3
  %357 = add i32 %356, 1
  %358 = call ptr @__remill_write_memory_32(ptr noundef %355, i64 noundef %352, i32 noundef %357) #3
  %359 = icmp ult i32 %357, %356
  %360 = icmp ult i32 %357, 1
  %361 = or i1 %359, %360
  %362 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %361, i32 noundef %356, i32 noundef 1, i32 noundef %357) #3
  %363 = zext i1 %362 to i8
  %364 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %363, ptr %364, align 1
  %365 = trunc i32 %357 to i8
  %366 = call i8 @llvm.ctpop.i8(i8 %365)
  %367 = and i8 %366, 1
  %368 = xor i8 %367, 1
  %369 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %368, ptr %369, align 1
  %370 = xor i32 %357, %356
  %371 = xor i32 %370, 1
  %372 = trunc i32 %371 to i8
  %373 = lshr i8 %372, 4
  %374 = and i8 %373, 1
  %375 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %374, ptr %375, align 1
  %376 = icmp eq i32 %357, 0
  %377 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %376, i32 noundef %356, i32 noundef 1, i32 noundef %357) #3
  %378 = zext i1 %377 to i8
  %379 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %378, ptr %379, align 1
  %380 = icmp slt i32 %357, 0
  %381 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %380, i32 noundef %356, i32 noundef 1, i32 noundef %357) #3
  %382 = zext i1 %381 to i8
  %383 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %382, ptr %383, align 1
  %384 = lshr i32 %370, 31
  %385 = xor i32 %357, 1
  %386 = lshr i32 %385, 31
  %387 = add nuw nsw i32 %384, %386
  %388 = icmp eq i32 %387, 2
  %389 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %388, i32 noundef %356, i32 noundef 1, i32 noundef %357) #3
  %390 = zext i1 %389 to i8
  %391 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %390, ptr %391, align 1
  store ptr %358, ptr %MEMORY, align 8
  br label %123

392:                                              ; preds = %191
  %393 = load i64, ptr %NEXT_PC, align 8
  store i64 %393, ptr %PC, align 8
  %394 = add i64 %393, 2
  store i64 %394, ptr %NEXT_PC, align 8
  %395 = load i32, ptr %EAX, align 4
  %396 = zext i32 %395 to i64
  %397 = load i32, ptr %EAX, align 4
  %398 = zext i32 %397 to i64
  %399 = load ptr, ptr %MEMORY, align 8
  %400 = and i32 %397, %395
  %401 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %401, align 1
  %402 = trunc i32 %400 to i8
  %403 = call i8 @llvm.ctpop.i8(i8 %402)
  %404 = and i8 %403, 1
  %405 = xor i8 %404, 1
  %406 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %405, ptr %406, align 1
  %407 = icmp eq i32 %400, 0
  %408 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %407, i32 noundef %395, i32 noundef %397, i32 noundef %400) #3
  %409 = zext i1 %408 to i8
  %410 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %409, ptr %410, align 1
  %411 = icmp slt i32 %400, 0
  %412 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %411, i32 noundef %395, i32 noundef %397, i32 noundef %400) #3
  %413 = zext i1 %412 to i8
  %414 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %413, ptr %414, align 1
  %415 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %415, align 1
  %416 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %416, align 1
  %417 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %417, ptr %416, align 1
  store ptr %399, ptr %MEMORY, align 8
  br label %418

418:                                              ; preds = %392
  %419 = load i64, ptr %NEXT_PC, align 8
  store i64 %419, ptr %PC, align 8
  %420 = add i64 %419, 2
  store i64 %420, ptr %NEXT_PC, align 8
  %421 = load i64, ptr %NEXT_PC, align 8
  %422 = add i64 %421, 25
  %423 = load i64, ptr %NEXT_PC, align 8
  %424 = load ptr, ptr %MEMORY, align 8
  %425 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %426 = load i8, ptr %425, align 1
  %427 = icmp ne i8 %426, 0
  %428 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  %429 = load i8, ptr %428, align 1
  %430 = icmp ne i8 %429, 0
  %431 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  %432 = load i8, ptr %431, align 1
  %433 = icmp ne i8 %432, 0
  %434 = xor i1 %430, %433
  %435 = or i1 %427, %434
  %436 = call zeroext i1 @__remill_compare_sle(i1 noundef zeroext %435) #4
  %437 = zext i1 %436 to i8
  store i8 %437, ptr %BRANCH_TAKEN, align 1
  %438 = select i1 %436, i64 %422, i64 %423
  store i64 %438, ptr %NEXT_PC, align 8
  store ptr %424, ptr %MEMORY, align 8
  %439 = load i8, ptr %BRANCH_TAKEN, align 1
  %440 = icmp eq i8 %439, 1
  br i1 %440, label %441, label %445

441:                                              ; preds = %475, %418
  %442 = load i64, ptr %NEXT_PC, align 8
  store i64 %442, ptr %PC, align 8
  %443 = add i64 %442, 5
  store i64 %443, ptr %NEXT_PC, align 8
  %444 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %444, ptr %MEMORY, align 8
  br label %491

445:                                              ; preds = %418
  %446 = load i64, ptr %NEXT_PC, align 8
  store i64 %446, ptr %PC, align 8
  %447 = add i64 %446, 3
  store i64 %447, ptr %NEXT_PC, align 8
  %448 = load i64, ptr %RBP, align 8
  %449 = sub i64 %448, 16
  %450 = load ptr, ptr %MEMORY, align 8
  %451 = call i32 @__remill_read_memory_32(ptr noundef %450, i64 noundef %449) #3
  %452 = zext i32 %451 to i64
  store i64 %452, ptr %RAX, align 8
  store ptr %450, ptr %MEMORY, align 8
  br label %453

453:                                              ; preds = %445
  %454 = load i64, ptr %NEXT_PC, align 8
  store i64 %454, ptr %PC, align 8
  %455 = add i64 %454, 2
  store i64 %455, ptr %NEXT_PC, align 8
  %456 = load i32, ptr %EAX, align 4
  %457 = zext i32 %456 to i64
  %458 = load ptr, ptr %MEMORY, align 8
  %459 = and i64 %457, 4294967295
  store i64 %459, ptr %RSI, align 8
  store ptr %458, ptr %MEMORY, align 8
  br label %460

460:                                              ; preds = %453
  %461 = load i64, ptr %NEXT_PC, align 8
  store i64 %461, ptr %PC, align 8
  %462 = add i64 %461, 7
  store i64 %462, ptr %NEXT_PC, align 8
  %463 = load i64, ptr %NEXT_PC, align 8
  %464 = add i64 %463, 3586
  %465 = load ptr, ptr %MEMORY, align 8
  store i64 %464, ptr %RAX, align 8
  store ptr %465, ptr %MEMORY, align 8
  br label %466

466:                                              ; preds = %460
  %467 = load i64, ptr %NEXT_PC, align 8
  store i64 %467, ptr %PC, align 8
  %468 = add i64 %467, 3
  store i64 %468, ptr %NEXT_PC, align 8
  %469 = load i64, ptr %RAX, align 8
  %470 = load ptr, ptr %MEMORY, align 8
  store i64 %469, ptr %RDI, align 8
  store ptr %470, ptr %MEMORY, align 8
  br label %471

471:                                              ; preds = %466
  %472 = load i64, ptr %NEXT_PC, align 8
  store i64 %472, ptr %PC, align 8
  %473 = add i64 %472, 5
  store i64 %473, ptr %NEXT_PC, align 8
  %474 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %474, ptr %MEMORY, align 8
  br label %475

475:                                              ; preds = %471
  %476 = load i64, ptr %NEXT_PC, align 8
  store i64 %476, ptr %PC, align 8
  %477 = add i64 %476, 5
  store i64 %477, ptr %NEXT_PC, align 8
  %478 = load i64, ptr %NEXT_PC, align 8
  %479 = sub i64 %478, 409
  %480 = load i64, ptr %NEXT_PC, align 8
  %481 = load ptr, ptr %MEMORY, align 8
  %482 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %483 = load i64, ptr %482, align 8
  %484 = add i64 %483, -8
  %485 = call ptr @__remill_write_memory_64(ptr noundef %481, i64 noundef %484, i64 noundef %480) #3
  store i64 %484, ptr %482, align 8
  %486 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %479, ptr %486, align 8
  store i64 %479, ptr %NEXT_PC, align 8
  store i64 %480, ptr %RETURN_PC, align 8
  store ptr %485, ptr %MEMORY, align 8
  %487 = load ptr, ptr %MEMORY, align 8
  %488 = load i64, ptr %PC, align 8
  %489 = call ptr @EXTERNAL.printf(ptr %state, i64 %488, ptr %487)
  %490 = load i64, ptr %RETURN_PC, align 8
  store i64 %490, ptr %NEXT_PC, align 8
  br label %441

491:                                              ; preds = %441
  %492 = load i64, ptr %NEXT_PC, align 8
  store i64 %492, ptr %PC, align 8
  %493 = add i64 %492, 4
  store i64 %493, ptr %NEXT_PC, align 8
  %494 = load i64, ptr %RBP, align 8
  %495 = sub i64 %494, 8
  %496 = load ptr, ptr %MEMORY, align 8
  %497 = call i64 @__remill_read_memory_64(ptr noundef %496, i64 noundef %495) #3
  store i64 %497, ptr %RDX, align 8
  store ptr %496, ptr %MEMORY, align 8
  br label %498

498:                                              ; preds = %491
  %499 = load i64, ptr %NEXT_PC, align 8
  store i64 %499, ptr %PC, align 8
  %500 = add i64 %499, 9
  store i64 %500, ptr %NEXT_PC, align 8
  %501 = load i64, ptr %RDX, align 8
  %502 = load i64, ptr %FSBASE, align 8
  %503 = add i64 40, %502
  %504 = load ptr, ptr %MEMORY, align 8
  %505 = call i64 @__remill_read_memory_64(ptr noundef %504, i64 noundef %503) #3
  %506 = sub i64 %501, %505
  store i64 %506, ptr %RDX, align 8
  %507 = icmp ugt i64 %505, %501
  %508 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %507, i64 noundef %501, i64 noundef %505, i64 noundef %506) #3
  %509 = zext i1 %508 to i8
  %510 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %509, ptr %510, align 1
  %511 = trunc i64 %506 to i8
  %512 = call i8 @llvm.ctpop.i8(i8 %511)
  %513 = and i8 %512, 1
  %514 = xor i8 %513, 1
  %515 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %514, ptr %515, align 1
  %516 = xor i64 %505, %501
  %517 = xor i64 %516, %506
  %518 = trunc i64 %517 to i8
  %519 = lshr i8 %518, 4
  %520 = and i8 %519, 1
  %521 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %520, ptr %521, align 1
  %522 = icmp eq i64 %505, %501
  %523 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %522, i64 noundef %501, i64 noundef %505, i64 noundef %506) #3
  %524 = zext i1 %523 to i8
  %525 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %524, ptr %525, align 1
  %526 = icmp slt i64 %506, 0
  %527 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %526, i64 noundef %501, i64 noundef %505, i64 noundef %506) #3
  %528 = zext i1 %527 to i8
  %529 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %528, ptr %529, align 1
  %530 = lshr i64 %516, 63
  %531 = xor i64 %506, %501
  %532 = lshr i64 %531, 63
  %533 = add nuw nsw i64 %532, %530
  %534 = icmp eq i64 %533, 2
  %535 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %534, i64 noundef %501, i64 noundef %505, i64 noundef %506) #3
  %536 = zext i1 %535 to i8
  %537 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %536, ptr %537, align 1
  store ptr %504, ptr %MEMORY, align 8
  br label %538

538:                                              ; preds = %498
  %539 = load i64, ptr %NEXT_PC, align 8
  store i64 %539, ptr %PC, align 8
  %540 = add i64 %539, 2
  store i64 %540, ptr %NEXT_PC, align 8
  %541 = load i64, ptr %NEXT_PC, align 8
  %542 = add i64 %541, 5
  %543 = load i64, ptr %NEXT_PC, align 8
  %544 = load ptr, ptr %MEMORY, align 8
  %545 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %546 = load i8, ptr %545, align 1
  %547 = icmp ne i8 %546, 0
  %548 = call zeroext i1 @__remill_compare_eq(i1 noundef zeroext %547) #4
  %549 = zext i1 %548 to i8
  store i8 %549, ptr %BRANCH_TAKEN, align 1
  %550 = select i1 %548, i64 %542, i64 %543
  store i64 %550, ptr %NEXT_PC, align 8
  store ptr %544, ptr %MEMORY, align 8
  %551 = load i8, ptr %BRANCH_TAKEN, align 1
  %552 = icmp eq i8 %551, 1
  br i1 %552, label %553, label %562

553:                                              ; preds = %562, %538
  %554 = load i64, ptr %NEXT_PC, align 8
  store i64 %554, ptr %PC, align 8
  %555 = add i64 %554, 1
  store i64 %555, ptr %NEXT_PC, align 8
  %556 = load ptr, ptr %MEMORY, align 8
  %557 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 15
  %558 = load i64, ptr %557, align 8
  %559 = call i64 @__remill_read_memory_64(ptr noundef %556, i64 noundef %558) #3
  store i64 %559, ptr %557, align 8
  %560 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %561 = add i64 %558, 8
  store i64 %561, ptr %560, align 8
  store ptr %556, ptr %MEMORY, align 8
  br label %578

562:                                              ; preds = %538
  %563 = load i64, ptr %NEXT_PC, align 8
  store i64 %563, ptr %PC, align 8
  %564 = add i64 %563, 5
  store i64 %564, ptr %NEXT_PC, align 8
  %565 = load i64, ptr %NEXT_PC, align 8
  %566 = sub i64 %565, 450
  %567 = load i64, ptr %NEXT_PC, align 8
  %568 = load ptr, ptr %MEMORY, align 8
  %569 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %570 = load i64, ptr %569, align 8
  %571 = add i64 %570, -8
  %572 = call ptr @__remill_write_memory_64(ptr noundef %568, i64 noundef %571, i64 noundef %567) #3
  store i64 %571, ptr %569, align 8
  %573 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %566, ptr %573, align 8
  store i64 %566, ptr %NEXT_PC, align 8
  store i64 %567, ptr %RETURN_PC, align 8
  store ptr %572, ptr %MEMORY, align 8
  %574 = load ptr, ptr %MEMORY, align 8
  %575 = load i64, ptr %PC, align 8
  %576 = call ptr @EXTERNAL.__stack_chk_fail(ptr %state, i64 %575, ptr %574)
  %577 = load i64, ptr %RETURN_PC, align 8
  store i64 %577, ptr %NEXT_PC, align 8
  br label %553

578:                                              ; preds = %553
  %579 = load i64, ptr %NEXT_PC, align 8
  store i64 %579, ptr %PC, align 8
  %580 = add i64 %579, 1
  store i64 %580, ptr %NEXT_PC, align 8
  %581 = load ptr, ptr %MEMORY, align 8
  %582 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %583 = load i64, ptr %582, align 8
  %584 = call i64 @__remill_read_memory_64(ptr noundef %581, i64 noundef %583) #3
  %585 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %584, ptr %585, align 8
  store i64 %584, ptr %NEXT_PC, align 8
  %586 = load i64, ptr %582, align 8
  %587 = add i64 %586, 8
  store i64 %587, ptr %582, align 8
  store ptr %581, ptr %MEMORY, align 8
  %588 = load i64, ptr %NEXT_PC, align 8
  store i64 %588, ptr %PC, align 8
  %589 = load ptr, ptr %MEMORY, align 8
  %590 = load i64, ptr %PC, align 8
  %591 = tail call ptr @__remill_function_return(ptr %state, i64 %590, ptr %589)
  ret ptr %591
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

define ptr @LIFTED._start(ptr noalias %state, i64 %program_counter, ptr noalias %memory) {
  %RDI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 11, i32 0, i32 0
  %ECX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 5, i32 0, i32 0
  %RCX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 5, i32 0, i32 0
  %R8D = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 17, i32 0, i32 0
  %R8 = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 17, i32 0, i32 0
  %RAX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0
  %RSP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 13, i32 0, i32 0
  %RSI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 9, i32 0, i32 0
  %RDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
  %R9 = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 19, i32 0, i32 0
  %EBP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 15, i32 0, i32 0
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
  %11 = add i64 %10, 2
  store i64 %11, ptr %NEXT_PC, align 8
  %12 = load i64, ptr %RBP, align 8
  %13 = load i32, ptr %EBP, align 4
  %14 = zext i32 %13 to i64
  %15 = load ptr, ptr %MEMORY, align 8
  %16 = trunc i64 %12 to i32
  %17 = xor i32 %13, %16
  %18 = zext i32 %17 to i64
  store i64 %18, ptr %RBP, align 8
  %19 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %19, align 1
  %20 = trunc i32 %17 to i8
  %21 = call i8 @llvm.ctpop.i8(i8 %20)
  %22 = and i8 %21, 1
  %23 = xor i8 %22, 1
  %24 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %23, ptr %24, align 1
  %25 = icmp eq i32 %17, 0
  %26 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %25, i32 noundef %16, i32 noundef %13, i32 noundef %17) #3
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %27, ptr %28, align 1
  %29 = icmp slt i32 %17, 0
  %30 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %29, i32 noundef %16, i32 noundef %13, i32 noundef %17) #3
  %31 = zext i1 %30 to i8
  %32 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %31, ptr %32, align 1
  %33 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %33, align 1
  %34 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %34, align 1
  %35 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %35, ptr %34, align 1
  store ptr %15, ptr %MEMORY, align 8
  br label %36

36:                                               ; preds = %9
  %37 = load i64, ptr %NEXT_PC, align 8
  store i64 %37, ptr %PC, align 8
  %38 = add i64 %37, 3
  store i64 %38, ptr %NEXT_PC, align 8
  %39 = load i64, ptr %RDX, align 8
  %40 = load ptr, ptr %MEMORY, align 8
  store i64 %39, ptr %R9, align 8
  store ptr %40, ptr %MEMORY, align 8
  br label %41

41:                                               ; preds = %36
  %42 = load i64, ptr %NEXT_PC, align 8
  store i64 %42, ptr %PC, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr %NEXT_PC, align 8
  %44 = load ptr, ptr %MEMORY, align 8
  %45 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %46 = load i64, ptr %45, align 8
  %47 = add i64 %46, 8
  store i64 %47, ptr %45, align 8
  %48 = call i64 @__remill_read_memory_64(ptr noundef %44, i64 noundef %46) #3
  store i64 %48, ptr %RSI, align 8
  store ptr %44, ptr %MEMORY, align 8
  br label %49

49:                                               ; preds = %41
  %50 = load i64, ptr %NEXT_PC, align 8
  store i64 %50, ptr %PC, align 8
  %51 = add i64 %50, 3
  store i64 %51, ptr %NEXT_PC, align 8
  %52 = load i64, ptr %RSP, align 8
  %53 = load ptr, ptr %MEMORY, align 8
  store i64 %52, ptr %RDX, align 8
  store ptr %53, ptr %MEMORY, align 8
  br label %54

54:                                               ; preds = %49
  %55 = load i64, ptr %NEXT_PC, align 8
  store i64 %55, ptr %PC, align 8
  %56 = add i64 %55, 4
  store i64 %56, ptr %NEXT_PC, align 8
  %57 = load i64, ptr %RSP, align 8
  %58 = load ptr, ptr %MEMORY, align 8
  %59 = and i64 -16, %57
  store i64 %59, ptr %RSP, align 8
  %60 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %60, align 1
  %61 = trunc i64 %59 to i8
  %62 = call i8 @llvm.ctpop.i8(i8 %61)
  %63 = and i8 %62, 1
  %64 = xor i8 %63, 1
  %65 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %64, ptr %65, align 1
  %66 = icmp eq i64 %59, 0
  %67 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %66, i64 noundef %57, i64 noundef -16, i64 noundef %59) #3
  %68 = zext i1 %67 to i8
  %69 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %68, ptr %69, align 1
  %70 = icmp slt i64 %59, 0
  %71 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %70, i64 noundef %57, i64 noundef -16, i64 noundef %59) #3
  %72 = zext i1 %71 to i8
  %73 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %72, ptr %73, align 1
  %74 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %74, align 1
  %75 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %75, align 1
  store ptr %58, ptr %MEMORY, align 8
  br label %76

76:                                               ; preds = %54
  %77 = load i64, ptr %NEXT_PC, align 8
  store i64 %77, ptr %PC, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr %NEXT_PC, align 8
  %79 = load i64, ptr %RAX, align 8
  %80 = load ptr, ptr %MEMORY, align 8
  %81 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %82 = load i64, ptr %81, align 8
  %83 = add i64 %82, -8
  %84 = call ptr @__remill_write_memory_64(ptr noundef %80, i64 noundef %83, i64 noundef %79) #3
  store i64 %83, ptr %81, align 8
  store ptr %84, ptr %MEMORY, align 8
  br label %85

85:                                               ; preds = %76
  %86 = load i64, ptr %NEXT_PC, align 8
  store i64 %86, ptr %PC, align 8
  %87 = add i64 %86, 1
  store i64 %87, ptr %NEXT_PC, align 8
  %88 = load i64, ptr %RSP, align 8
  %89 = load ptr, ptr %MEMORY, align 8
  %90 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %91 = load i64, ptr %90, align 8
  %92 = add i64 %91, -8
  %93 = call ptr @__remill_write_memory_64(ptr noundef %89, i64 noundef %92, i64 noundef %88) #3
  store i64 %92, ptr %90, align 8
  store ptr %93, ptr %MEMORY, align 8
  br label %94

94:                                               ; preds = %85
  %95 = load i64, ptr %NEXT_PC, align 8
  store i64 %95, ptr %PC, align 8
  %96 = add i64 %95, 3
  store i64 %96, ptr %NEXT_PC, align 8
  %97 = load i64, ptr %R8, align 8
  %98 = load i32, ptr %R8D, align 4
  %99 = zext i32 %98 to i64
  %100 = load ptr, ptr %MEMORY, align 8
  %101 = trunc i64 %97 to i32
  %102 = xor i32 %98, %101
  %103 = zext i32 %102 to i64
  store i64 %103, ptr %R8, align 8
  %104 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %104, align 1
  %105 = trunc i32 %102 to i8
  %106 = call i8 @llvm.ctpop.i8(i8 %105)
  %107 = and i8 %106, 1
  %108 = xor i8 %107, 1
  %109 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %108, ptr %109, align 1
  %110 = icmp eq i32 %102, 0
  %111 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %110, i32 noundef %101, i32 noundef %98, i32 noundef %102) #3
  %112 = zext i1 %111 to i8
  %113 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %112, ptr %113, align 1
  %114 = icmp slt i32 %102, 0
  %115 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %114, i32 noundef %101, i32 noundef %98, i32 noundef %102) #3
  %116 = zext i1 %115 to i8
  %117 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %116, ptr %117, align 1
  %118 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %118, align 1
  %119 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %119, align 1
  %120 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %120, ptr %119, align 1
  store ptr %100, ptr %MEMORY, align 8
  br label %121

121:                                              ; preds = %94
  %122 = load i64, ptr %NEXT_PC, align 8
  store i64 %122, ptr %PC, align 8
  %123 = add i64 %122, 2
  store i64 %123, ptr %NEXT_PC, align 8
  %124 = load i64, ptr %RCX, align 8
  %125 = load i32, ptr %ECX, align 4
  %126 = zext i32 %125 to i64
  %127 = load ptr, ptr %MEMORY, align 8
  %128 = trunc i64 %124 to i32
  %129 = xor i32 %125, %128
  %130 = zext i32 %129 to i64
  store i64 %130, ptr %RCX, align 8
  %131 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %131, align 1
  %132 = trunc i32 %129 to i8
  %133 = call i8 @llvm.ctpop.i8(i8 %132)
  %134 = and i8 %133, 1
  %135 = xor i8 %134, 1
  %136 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %135, ptr %136, align 1
  %137 = icmp eq i32 %129, 0
  %138 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %137, i32 noundef %128, i32 noundef %125, i32 noundef %129) #3
  %139 = zext i1 %138 to i8
  %140 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %139, ptr %140, align 1
  %141 = icmp slt i32 %129, 0
  %142 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %141, i32 noundef %128, i32 noundef %125, i32 noundef %129) #3
  %143 = zext i1 %142 to i8
  %144 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %143, ptr %144, align 1
  %145 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %145, align 1
  %146 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %146, align 1
  %147 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %147, ptr %146, align 1
  store ptr %127, ptr %MEMORY, align 8
  br label %148

148:                                              ; preds = %121
  %149 = load i64, ptr %NEXT_PC, align 8
  store i64 %149, ptr %PC, align 8
  %150 = add i64 %149, 7
  store i64 %150, ptr %NEXT_PC, align 8
  %151 = load i64, ptr %NEXT_PC, align 8
  %152 = add i64 %151, 202
  %153 = load ptr, ptr %MEMORY, align 8
  store i64 %152, ptr %RDI, align 8
  store ptr %153, ptr %MEMORY, align 8
  br label %154

154:                                              ; preds = %148
  %155 = load i64, ptr %NEXT_PC, align 8
  store i64 %155, ptr %PC, align 8
  %156 = add i64 %155, 6
  store i64 %156, ptr %NEXT_PC, align 8
  %157 = load i64, ptr %NEXT_PC, align 8
  %158 = add i64 %157, 12051
  %159 = load i64, ptr %NEXT_PC, align 8
  %160 = load ptr, ptr %MEMORY, align 8
  %161 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %162 = load i64, ptr %161, align 8
  %163 = add i64 %162, -8
  %164 = call i64 @__remill_read_memory_64(ptr noundef %160, i64 noundef %158) #3
  %165 = call ptr @__remill_write_memory_64(ptr noundef %160, i64 noundef %163, i64 noundef %159) #3
  store i64 %163, ptr %161, align 8
  %166 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %164, ptr %166, align 8
  store i64 %164, ptr %NEXT_PC, align 8
  store i64 %159, ptr %RETURN_PC, align 8
  store ptr %165, ptr %MEMORY, align 8
  %167 = load ptr, ptr %MEMORY, align 8
  %168 = load i64, ptr %PC, align 8
  %169 = call ptr @__remill_function_call(ptr %state, i64 %168, ptr %167)
  br label %170

170:                                              ; preds = %154
  %171 = load i64, ptr %RETURN_PC, align 8
  store i64 %171, ptr %NEXT_PC, align 8
  br label %172

172:                                              ; preds = %170
  %173 = load i64, ptr %NEXT_PC, align 8
  store i64 %173, ptr %PC, align 8
  %174 = add i64 %173, 1
  store i64 %174, ptr %NEXT_PC, align 8
  %175 = load ptr, ptr %MEMORY, align 8
  store ptr %175, ptr %MEMORY, align 8
  %176 = load i64, ptr %NEXT_PC, align 8
  store i64 %176, ptr %PC, align 8
  %177 = load ptr, ptr %MEMORY, align 8
  %178 = load i64, ptr %PC, align 8
  %179 = tail call ptr @__remill_error(ptr %state, i64 %178, ptr %177)
  ret ptr %179
}

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
