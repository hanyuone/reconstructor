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
  %RDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
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
  %28 = sub i64 %26, 96
  store i64 %28, ptr %RSP, align 8
  %29 = icmp ult i64 %26, 96
  %30 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %29, i64 noundef %26, i64 noundef 96, i64 noundef %28) #3
  %31 = zext i1 %30 to i8
  %32 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %31, ptr %32, align 1
  %33 = trunc i64 %28 to i8
  %34 = call i8 @llvm.ctpop.i8(i8 %33)
  %35 = and i8 %34, 1
  %36 = xor i8 %35, 1
  %37 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %36, ptr %37, align 1
  %38 = xor i64 96, %26
  %39 = xor i64 %38, %28
  %40 = trunc i64 %39 to i8
  %41 = lshr i8 %40, 4
  %42 = and i8 %41, 1
  %43 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %42, ptr %43, align 1
  %44 = icmp eq i64 %26, 96
  %45 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %44, i64 noundef %26, i64 noundef 96, i64 noundef %28) #3
  %46 = zext i1 %45 to i8
  %47 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %46, ptr %47, align 1
  %48 = icmp slt i64 %28, 0
  %49 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %48, i64 noundef %26, i64 noundef 96, i64 noundef %28) #3
  %50 = zext i1 %49 to i8
  %51 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %50, ptr %51, align 1
  %52 = lshr i64 %38, 63
  %53 = xor i64 %28, %26
  %54 = lshr i64 %53, 63
  %55 = add nuw nsw i64 %54, %52
  %56 = icmp eq i64 %55, 2
  %57 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %56, i64 noundef %26, i64 noundef 96, i64 noundef %28) #3
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
  %106 = sub i64 %105, 80
  %107 = load ptr, ptr %MEMORY, align 8
  %108 = call ptr @__remill_write_memory_32(ptr noundef %107, i64 noundef %106, i32 noundef 5) #3
  store ptr %108, ptr %MEMORY, align 8
  br label %109

109:                                              ; preds = %102
  %110 = load i64, ptr %NEXT_PC, align 8
  store i64 %110, ptr %PC, align 8
  %111 = add i64 %110, 7
  store i64 %111, ptr %NEXT_PC, align 8
  %112 = load i64, ptr %RBP, align 8
  %113 = sub i64 %112, 76
  %114 = load ptr, ptr %MEMORY, align 8
  %115 = call ptr @__remill_write_memory_32(ptr noundef %114, i64 noundef %113, i32 noundef 10) #3
  store ptr %115, ptr %MEMORY, align 8
  br label %116

116:                                              ; preds = %109
  %117 = load i64, ptr %NEXT_PC, align 8
  store i64 %117, ptr %PC, align 8
  %118 = add i64 %117, 7
  store i64 %118, ptr %NEXT_PC, align 8
  %119 = load i64, ptr %RBP, align 8
  %120 = sub i64 %119, 84
  %121 = load ptr, ptr %MEMORY, align 8
  %122 = call ptr @__remill_write_memory_32(ptr noundef %121, i64 noundef %120, i32 noundef 0) #3
  store ptr %122, ptr %MEMORY, align 8
  br label %123

123:                                              ; preds = %116
  %124 = load i64, ptr %NEXT_PC, align 8
  store i64 %124, ptr %PC, align 8
  %125 = add i64 %124, 4
  store i64 %125, ptr %NEXT_PC, align 8
  %126 = load i64, ptr %RBP, align 8
  %127 = sub i64 %126, 48
  %128 = load ptr, ptr %MEMORY, align 8
  store i64 %127, ptr %RAX, align 8
  store ptr %128, ptr %MEMORY, align 8
  br label %129

129:                                              ; preds = %123
  %130 = load i64, ptr %NEXT_PC, align 8
  store i64 %130, ptr %PC, align 8
  %131 = add i64 %130, 4
  store i64 %131, ptr %NEXT_PC, align 8
  %132 = load i64, ptr %RBP, align 8
  %133 = sub i64 %132, 72
  %134 = load i64, ptr %RAX, align 8
  %135 = load ptr, ptr %MEMORY, align 8
  %136 = call ptr @__remill_write_memory_64(ptr noundef %135, i64 noundef %133, i64 noundef %134) #3
  store ptr %136, ptr %MEMORY, align 8
  br label %137

137:                                              ; preds = %129
  %138 = load i64, ptr %NEXT_PC, align 8
  store i64 %138, ptr %PC, align 8
  %139 = add i64 %138, 4
  store i64 %139, ptr %NEXT_PC, align 8
  %140 = load i64, ptr %RBP, align 8
  %141 = sub i64 %140, 72
  %142 = load ptr, ptr %MEMORY, align 8
  %143 = call i64 @__remill_read_memory_64(ptr noundef %142, i64 noundef %141) #3
  store i64 %143, ptr %RAX, align 8
  store ptr %142, ptr %MEMORY, align 8
  br label %144

144:                                              ; preds = %137
  %145 = load i64, ptr %NEXT_PC, align 8
  store i64 %145, ptr %PC, align 8
  %146 = add i64 %145, 4
  store i64 %146, ptr %NEXT_PC, align 8
  %147 = load i64, ptr %RBP, align 8
  %148 = sub i64 %147, 56
  %149 = load i64, ptr %RAX, align 8
  %150 = load ptr, ptr %MEMORY, align 8
  %151 = call ptr @__remill_write_memory_64(ptr noundef %150, i64 noundef %148, i64 noundef %149) #3
  store ptr %151, ptr %MEMORY, align 8
  br label %152

152:                                              ; preds = %144
  %153 = load i64, ptr %NEXT_PC, align 8
  store i64 %153, ptr %PC, align 8
  %154 = add i64 %153, 4
  store i64 %154, ptr %NEXT_PC, align 8
  %155 = load i64, ptr %RBP, align 8
  %156 = sub i64 %155, 48
  %157 = load ptr, ptr %MEMORY, align 8
  store i64 %156, ptr %RAX, align 8
  store ptr %157, ptr %MEMORY, align 8
  br label %158

158:                                              ; preds = %152
  %159 = load i64, ptr %NEXT_PC, align 8
  store i64 %159, ptr %PC, align 8
  %160 = add i64 %159, 4
  store i64 %160, ptr %NEXT_PC, align 8
  %161 = load i64, ptr %RAX, align 8
  %162 = load ptr, ptr %MEMORY, align 8
  %163 = add i64 20, %161
  store i64 %163, ptr %RAX, align 8
  %164 = icmp ult i64 %163, %161
  %165 = icmp ult i64 %163, 20
  %166 = or i1 %164, %165
  %167 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %166, i64 noundef %161, i64 noundef 20, i64 noundef %163) #3
  %168 = zext i1 %167 to i8
  %169 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %168, ptr %169, align 1
  %170 = trunc i64 %163 to i8
  %171 = call i8 @llvm.ctpop.i8(i8 %170)
  %172 = and i8 %171, 1
  %173 = xor i8 %172, 1
  %174 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %173, ptr %174, align 1
  %175 = xor i64 %163, %161
  %176 = xor i64 %175, 20
  %177 = trunc i64 %176 to i8
  %178 = lshr i8 %177, 4
  %179 = and i8 %178, 1
  %180 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %179, ptr %180, align 1
  %181 = icmp eq i64 %163, 0
  %182 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %181, i64 noundef %161, i64 noundef 20, i64 noundef %163) #3
  %183 = zext i1 %182 to i8
  %184 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %183, ptr %184, align 1
  %185 = icmp slt i64 %163, 0
  %186 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %185, i64 noundef %161, i64 noundef 20, i64 noundef %163) #3
  %187 = zext i1 %186 to i8
  %188 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %187, ptr %188, align 1
  %189 = lshr i64 %175, 63
  %190 = xor i64 %163, 20
  %191 = lshr i64 %190, 63
  %192 = add nuw nsw i64 %189, %191
  %193 = icmp eq i64 %192, 2
  %194 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %193, i64 noundef %161, i64 noundef 20, i64 noundef %163) #3
  %195 = zext i1 %194 to i8
  %196 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %195, ptr %196, align 1
  store ptr %162, ptr %MEMORY, align 8
  br label %197

197:                                              ; preds = %158
  %198 = load i64, ptr %NEXT_PC, align 8
  store i64 %198, ptr %PC, align 8
  %199 = add i64 %198, 4
  store i64 %199, ptr %NEXT_PC, align 8
  %200 = load i64, ptr %RBP, align 8
  %201 = sub i64 %200, 64
  %202 = load i64, ptr %RAX, align 8
  %203 = load ptr, ptr %MEMORY, align 8
  %204 = call ptr @__remill_write_memory_64(ptr noundef %203, i64 noundef %201, i64 noundef %202) #3
  store ptr %204, ptr %MEMORY, align 8
  br label %205

205:                                              ; preds = %197
  %206 = load i64, ptr %NEXT_PC, align 8
  store i64 %206, ptr %PC, align 8
  %207 = add i64 %206, 2
  store i64 %207, ptr %NEXT_PC, align 8
  %208 = load i64, ptr %NEXT_PC, align 8
  %209 = add i64 %208, 32
  %210 = load ptr, ptr %MEMORY, align 8
  %211 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %209, ptr %211, align 8
  store i64 %209, ptr %NEXT_PC, align 8
  store ptr %210, ptr %MEMORY, align 8
  br label %212

212:                                              ; preds = %415, %205
  %213 = load i64, ptr %NEXT_PC, align 8
  store i64 %213, ptr %PC, align 8
  %214 = add i64 %213, 4
  store i64 %214, ptr %NEXT_PC, align 8
  %215 = load i64, ptr %RBP, align 8
  %216 = sub i64 %215, 84
  %217 = load ptr, ptr %MEMORY, align 8
  %218 = call i32 @__remill_read_memory_32(ptr noundef %217, i64 noundef %216) #3
  %219 = sub i32 %218, 4
  %220 = icmp ult i32 %218, 4
  %221 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %220, i32 noundef %218, i32 noundef 4, i32 noundef %219) #3
  %222 = zext i1 %221 to i8
  %223 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %222, ptr %223, align 1
  %224 = trunc i32 %219 to i8
  %225 = call i8 @llvm.ctpop.i8(i8 %224)
  %226 = and i8 %225, 1
  %227 = xor i8 %226, 1
  %228 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %227, ptr %228, align 1
  %229 = xor i32 %218, 4
  %230 = xor i32 %229, %219
  %231 = trunc i32 %230 to i8
  %232 = lshr i8 %231, 4
  %233 = and i8 %232, 1
  %234 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %233, ptr %234, align 1
  %235 = icmp eq i32 %218, 4
  %236 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %235, i32 noundef %218, i32 noundef 4, i32 noundef %219) #3
  %237 = zext i1 %236 to i8
  %238 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %237, ptr %238, align 1
  %239 = icmp slt i32 %219, 0
  %240 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %239, i32 noundef %218, i32 noundef 4, i32 noundef %219) #3
  %241 = zext i1 %240 to i8
  %242 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %241, ptr %242, align 1
  %243 = lshr i32 %229, 31
  %244 = xor i32 %219, %218
  %245 = lshr i32 %244, 31
  %246 = add nuw nsw i32 %245, %243
  %247 = icmp eq i32 %246, 2
  %248 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %247, i32 noundef %218, i32 noundef 4, i32 noundef %219) #3
  %249 = zext i1 %248 to i8
  %250 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %249, ptr %250, align 1
  store ptr %217, ptr %MEMORY, align 8
  br label %251

251:                                              ; preds = %212
  %252 = load i64, ptr %NEXT_PC, align 8
  store i64 %252, ptr %PC, align 8
  %253 = add i64 %252, 2
  store i64 %253, ptr %NEXT_PC, align 8
  %254 = load i64, ptr %NEXT_PC, align 8
  %255 = sub i64 %254, 38
  %256 = load i64, ptr %NEXT_PC, align 8
  %257 = load ptr, ptr %MEMORY, align 8
  %258 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %259 = load i8, ptr %258, align 1
  %260 = icmp ne i8 %259, 0
  %261 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  %262 = load i8, ptr %261, align 1
  %263 = icmp ne i8 %262, 0
  %264 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  %265 = load i8, ptr %264, align 1
  %266 = icmp ne i8 %265, 0
  %267 = xor i1 %263, %266
  %268 = or i1 %260, %267
  %269 = call zeroext i1 @__remill_compare_sle(i1 noundef zeroext %268) #4
  %270 = zext i1 %269 to i8
  store i8 %270, ptr %BRANCH_TAKEN, align 1
  %271 = select i1 %269, i64 %255, i64 %256
  store i64 %271, ptr %NEXT_PC, align 8
  store ptr %257, ptr %MEMORY, align 8
  %272 = load i8, ptr %BRANCH_TAKEN, align 1
  %273 = icmp eq i8 %272, 1
  br i1 %273, label %274, label %281

274:                                              ; preds = %251
  %275 = load i64, ptr %NEXT_PC, align 8
  store i64 %275, ptr %PC, align 8
  %276 = add i64 %275, 4
  store i64 %276, ptr %NEXT_PC, align 8
  %277 = load i64, ptr %RBP, align 8
  %278 = sub i64 %277, 72
  %279 = load ptr, ptr %MEMORY, align 8
  %280 = call i64 @__remill_read_memory_64(ptr noundef %279, i64 noundef %278) #3
  store i64 %280, ptr %RAX, align 8
  store ptr %279, ptr %MEMORY, align 8
  br label %288

281:                                              ; preds = %251
  %282 = load i64, ptr %NEXT_PC, align 8
  store i64 %282, ptr %PC, align 8
  %283 = add i64 %282, 4
  store i64 %283, ptr %NEXT_PC, align 8
  %284 = load i64, ptr %RBP, align 8
  %285 = sub i64 %284, 56
  %286 = load ptr, ptr %MEMORY, align 8
  %287 = call i64 @__remill_read_memory_64(ptr noundef %286, i64 noundef %285) #3
  store i64 %287, ptr %RAX, align 8
  store ptr %286, ptr %MEMORY, align 8
  br label %459

288:                                              ; preds = %274
  %289 = load i64, ptr %NEXT_PC, align 8
  store i64 %289, ptr %PC, align 8
  %290 = add i64 %289, 3
  store i64 %290, ptr %NEXT_PC, align 8
  %291 = load i64, ptr %RBP, align 8
  %292 = sub i64 %291, 80
  %293 = load ptr, ptr %MEMORY, align 8
  %294 = call i32 @__remill_read_memory_32(ptr noundef %293, i64 noundef %292) #3
  %295 = zext i32 %294 to i64
  store i64 %295, ptr %RDX, align 8
  store ptr %293, ptr %MEMORY, align 8
  br label %296

296:                                              ; preds = %288
  %297 = load i64, ptr %NEXT_PC, align 8
  store i64 %297, ptr %PC, align 8
  %298 = add i64 %297, 2
  store i64 %298, ptr %NEXT_PC, align 8
  %299 = load i64, ptr %RAX, align 8
  %300 = load i32, ptr %EDX, align 4
  %301 = zext i32 %300 to i64
  %302 = load ptr, ptr %MEMORY, align 8
  %303 = call ptr @__remill_write_memory_32(ptr noundef %302, i64 noundef %299, i32 noundef %300) #3
  store ptr %303, ptr %MEMORY, align 8
  br label %304

304:                                              ; preds = %296
  %305 = load i64, ptr %NEXT_PC, align 8
  store i64 %305, ptr %PC, align 8
  %306 = add i64 %305, 4
  store i64 %306, ptr %NEXT_PC, align 8
  %307 = load i64, ptr %RBP, align 8
  %308 = sub i64 %307, 64
  %309 = load ptr, ptr %MEMORY, align 8
  %310 = call i64 @__remill_read_memory_64(ptr noundef %309, i64 noundef %308) #3
  store i64 %310, ptr %RAX, align 8
  store ptr %309, ptr %MEMORY, align 8
  br label %311

311:                                              ; preds = %304
  %312 = load i64, ptr %NEXT_PC, align 8
  store i64 %312, ptr %PC, align 8
  %313 = add i64 %312, 3
  store i64 %313, ptr %NEXT_PC, align 8
  %314 = load i64, ptr %RBP, align 8
  %315 = sub i64 %314, 76
  %316 = load ptr, ptr %MEMORY, align 8
  %317 = call i32 @__remill_read_memory_32(ptr noundef %316, i64 noundef %315) #3
  %318 = zext i32 %317 to i64
  store i64 %318, ptr %RDX, align 8
  store ptr %316, ptr %MEMORY, align 8
  br label %319

319:                                              ; preds = %311
  %320 = load i64, ptr %NEXT_PC, align 8
  store i64 %320, ptr %PC, align 8
  %321 = add i64 %320, 2
  store i64 %321, ptr %NEXT_PC, align 8
  %322 = load i64, ptr %RAX, align 8
  %323 = load i32, ptr %EDX, align 4
  %324 = zext i32 %323 to i64
  %325 = load ptr, ptr %MEMORY, align 8
  %326 = call ptr @__remill_write_memory_32(ptr noundef %325, i64 noundef %322, i32 noundef %323) #3
  store ptr %326, ptr %MEMORY, align 8
  br label %327

327:                                              ; preds = %319
  %328 = load i64, ptr %NEXT_PC, align 8
  store i64 %328, ptr %PC, align 8
  %329 = add i64 %328, 5
  store i64 %329, ptr %NEXT_PC, align 8
  %330 = load i64, ptr %RBP, align 8
  %331 = sub i64 %330, 72
  %332 = load i64, ptr %RBP, align 8
  %333 = sub i64 %332, 72
  %334 = load ptr, ptr %MEMORY, align 8
  %335 = call i64 @__remill_read_memory_64(ptr noundef %334, i64 noundef %333) #3
  %336 = add i64 %335, 4
  %337 = call ptr @__remill_write_memory_64(ptr noundef %334, i64 noundef %331, i64 noundef %336) #3
  %338 = icmp ult i64 %336, %335
  %339 = icmp ult i64 %336, 4
  %340 = or i1 %338, %339
  %341 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %340, i64 noundef %335, i64 noundef 4, i64 noundef %336) #3
  %342 = zext i1 %341 to i8
  %343 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %342, ptr %343, align 1
  %344 = trunc i64 %336 to i8
  %345 = call i8 @llvm.ctpop.i8(i8 %344)
  %346 = and i8 %345, 1
  %347 = xor i8 %346, 1
  %348 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %347, ptr %348, align 1
  %349 = xor i64 %336, %335
  %350 = xor i64 %349, 4
  %351 = trunc i64 %350 to i8
  %352 = lshr i8 %351, 4
  %353 = and i8 %352, 1
  %354 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %353, ptr %354, align 1
  %355 = icmp eq i64 %336, 0
  %356 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %355, i64 noundef %335, i64 noundef 4, i64 noundef %336) #3
  %357 = zext i1 %356 to i8
  %358 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %357, ptr %358, align 1
  %359 = icmp slt i64 %336, 0
  %360 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %359, i64 noundef %335, i64 noundef 4, i64 noundef %336) #3
  %361 = zext i1 %360 to i8
  %362 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %361, ptr %362, align 1
  %363 = lshr i64 %349, 63
  %364 = xor i64 %336, 4
  %365 = lshr i64 %364, 63
  %366 = add nuw nsw i64 %363, %365
  %367 = icmp eq i64 %366, 2
  %368 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %367, i64 noundef %335, i64 noundef 4, i64 noundef %336) #3
  %369 = zext i1 %368 to i8
  %370 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %369, ptr %370, align 1
  store ptr %337, ptr %MEMORY, align 8
  br label %371

371:                                              ; preds = %327
  %372 = load i64, ptr %NEXT_PC, align 8
  store i64 %372, ptr %PC, align 8
  %373 = add i64 %372, 5
  store i64 %373, ptr %NEXT_PC, align 8
  %374 = load i64, ptr %RBP, align 8
  %375 = sub i64 %374, 64
  %376 = load i64, ptr %RBP, align 8
  %377 = sub i64 %376, 64
  %378 = load ptr, ptr %MEMORY, align 8
  %379 = call i64 @__remill_read_memory_64(ptr noundef %378, i64 noundef %377) #3
  %380 = add i64 %379, 4
  %381 = call ptr @__remill_write_memory_64(ptr noundef %378, i64 noundef %375, i64 noundef %380) #3
  %382 = icmp ult i64 %380, %379
  %383 = icmp ult i64 %380, 4
  %384 = or i1 %382, %383
  %385 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %384, i64 noundef %379, i64 noundef 4, i64 noundef %380) #3
  %386 = zext i1 %385 to i8
  %387 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %386, ptr %387, align 1
  %388 = trunc i64 %380 to i8
  %389 = call i8 @llvm.ctpop.i8(i8 %388)
  %390 = and i8 %389, 1
  %391 = xor i8 %390, 1
  %392 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %391, ptr %392, align 1
  %393 = xor i64 %380, %379
  %394 = xor i64 %393, 4
  %395 = trunc i64 %394 to i8
  %396 = lshr i8 %395, 4
  %397 = and i8 %396, 1
  %398 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %397, ptr %398, align 1
  %399 = icmp eq i64 %380, 0
  %400 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %399, i64 noundef %379, i64 noundef 4, i64 noundef %380) #3
  %401 = zext i1 %400 to i8
  %402 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %401, ptr %402, align 1
  %403 = icmp slt i64 %380, 0
  %404 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %403, i64 noundef %379, i64 noundef 4, i64 noundef %380) #3
  %405 = zext i1 %404 to i8
  %406 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %405, ptr %406, align 1
  %407 = lshr i64 %393, 63
  %408 = xor i64 %380, 4
  %409 = lshr i64 %408, 63
  %410 = add nuw nsw i64 %407, %409
  %411 = icmp eq i64 %410, 2
  %412 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %411, i64 noundef %379, i64 noundef 4, i64 noundef %380) #3
  %413 = zext i1 %412 to i8
  %414 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %413, ptr %414, align 1
  store ptr %381, ptr %MEMORY, align 8
  br label %415

415:                                              ; preds = %371
  %416 = load i64, ptr %NEXT_PC, align 8
  store i64 %416, ptr %PC, align 8
  %417 = add i64 %416, 4
  store i64 %417, ptr %NEXT_PC, align 8
  %418 = load i64, ptr %RBP, align 8
  %419 = sub i64 %418, 84
  %420 = load i64, ptr %RBP, align 8
  %421 = sub i64 %420, 84
  %422 = load ptr, ptr %MEMORY, align 8
  %423 = call i32 @__remill_read_memory_32(ptr noundef %422, i64 noundef %421) #3
  %424 = add i32 %423, 1
  %425 = call ptr @__remill_write_memory_32(ptr noundef %422, i64 noundef %419, i32 noundef %424) #3
  %426 = icmp ult i32 %424, %423
  %427 = icmp ult i32 %424, 1
  %428 = or i1 %426, %427
  %429 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %428, i32 noundef %423, i32 noundef 1, i32 noundef %424) #3
  %430 = zext i1 %429 to i8
  %431 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %430, ptr %431, align 1
  %432 = trunc i32 %424 to i8
  %433 = call i8 @llvm.ctpop.i8(i8 %432)
  %434 = and i8 %433, 1
  %435 = xor i8 %434, 1
  %436 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %435, ptr %436, align 1
  %437 = xor i32 %424, %423
  %438 = xor i32 %437, 1
  %439 = trunc i32 %438 to i8
  %440 = lshr i8 %439, 4
  %441 = and i8 %440, 1
  %442 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %441, ptr %442, align 1
  %443 = icmp eq i32 %424, 0
  %444 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %443, i32 noundef %423, i32 noundef 1, i32 noundef %424) #3
  %445 = zext i1 %444 to i8
  %446 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %445, ptr %446, align 1
  %447 = icmp slt i32 %424, 0
  %448 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %447, i32 noundef %423, i32 noundef 1, i32 noundef %424) #3
  %449 = zext i1 %448 to i8
  %450 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %449, ptr %450, align 1
  %451 = lshr i32 %437, 31
  %452 = xor i32 %424, 1
  %453 = lshr i32 %452, 31
  %454 = add nuw nsw i32 %451, %453
  %455 = icmp eq i32 %454, 2
  %456 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %455, i32 noundef %423, i32 noundef 1, i32 noundef %424) #3
  %457 = zext i1 %456 to i8
  %458 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %457, ptr %458, align 1
  store ptr %425, ptr %MEMORY, align 8
  br label %212

459:                                              ; preds = %281
  %460 = load i64, ptr %NEXT_PC, align 8
  store i64 %460, ptr %PC, align 8
  %461 = add i64 %460, 2
  store i64 %461, ptr %NEXT_PC, align 8
  %462 = load i64, ptr %RAX, align 8
  %463 = load ptr, ptr %MEMORY, align 8
  %464 = call i32 @__remill_read_memory_32(ptr noundef %463, i64 noundef %462) #3
  %465 = zext i32 %464 to i64
  store i64 %465, ptr %RAX, align 8
  store ptr %463, ptr %MEMORY, align 8
  br label %466

466:                                              ; preds = %459
  %467 = load i64, ptr %NEXT_PC, align 8
  store i64 %467, ptr %PC, align 8
  %468 = add i64 %467, 4
  store i64 %468, ptr %NEXT_PC, align 8
  %469 = load i64, ptr %RBP, align 8
  %470 = sub i64 %469, 8
  %471 = load ptr, ptr %MEMORY, align 8
  %472 = call i64 @__remill_read_memory_64(ptr noundef %471, i64 noundef %470) #3
  store i64 %472, ptr %RDX, align 8
  store ptr %471, ptr %MEMORY, align 8
  br label %473

473:                                              ; preds = %466
  %474 = load i64, ptr %NEXT_PC, align 8
  store i64 %474, ptr %PC, align 8
  %475 = add i64 %474, 9
  store i64 %475, ptr %NEXT_PC, align 8
  %476 = load i64, ptr %RDX, align 8
  %477 = load i64, ptr %FSBASE, align 8
  %478 = add i64 40, %477
  %479 = load ptr, ptr %MEMORY, align 8
  %480 = call i64 @__remill_read_memory_64(ptr noundef %479, i64 noundef %478) #3
  %481 = sub i64 %476, %480
  store i64 %481, ptr %RDX, align 8
  %482 = icmp ugt i64 %480, %476
  %483 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %482, i64 noundef %476, i64 noundef %480, i64 noundef %481) #3
  %484 = zext i1 %483 to i8
  %485 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %484, ptr %485, align 1
  %486 = trunc i64 %481 to i8
  %487 = call i8 @llvm.ctpop.i8(i8 %486)
  %488 = and i8 %487, 1
  %489 = xor i8 %488, 1
  %490 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %489, ptr %490, align 1
  %491 = xor i64 %480, %476
  %492 = xor i64 %491, %481
  %493 = trunc i64 %492 to i8
  %494 = lshr i8 %493, 4
  %495 = and i8 %494, 1
  %496 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %495, ptr %496, align 1
  %497 = icmp eq i64 %480, %476
  %498 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %497, i64 noundef %476, i64 noundef %480, i64 noundef %481) #3
  %499 = zext i1 %498 to i8
  %500 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %499, ptr %500, align 1
  %501 = icmp slt i64 %481, 0
  %502 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %501, i64 noundef %476, i64 noundef %480, i64 noundef %481) #3
  %503 = zext i1 %502 to i8
  %504 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %503, ptr %504, align 1
  %505 = lshr i64 %491, 63
  %506 = xor i64 %481, %476
  %507 = lshr i64 %506, 63
  %508 = add nuw nsw i64 %507, %505
  %509 = icmp eq i64 %508, 2
  %510 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %509, i64 noundef %476, i64 noundef %480, i64 noundef %481) #3
  %511 = zext i1 %510 to i8
  %512 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %511, ptr %512, align 1
  store ptr %479, ptr %MEMORY, align 8
  br label %513

513:                                              ; preds = %473
  %514 = load i64, ptr %NEXT_PC, align 8
  store i64 %514, ptr %PC, align 8
  %515 = add i64 %514, 2
  store i64 %515, ptr %NEXT_PC, align 8
  %516 = load i64, ptr %NEXT_PC, align 8
  %517 = add i64 %516, 5
  %518 = load i64, ptr %NEXT_PC, align 8
  %519 = load ptr, ptr %MEMORY, align 8
  %520 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %521 = load i8, ptr %520, align 1
  %522 = icmp ne i8 %521, 0
  %523 = call zeroext i1 @__remill_compare_eq(i1 noundef zeroext %522) #4
  %524 = zext i1 %523 to i8
  store i8 %524, ptr %BRANCH_TAKEN, align 1
  %525 = select i1 %523, i64 %517, i64 %518
  store i64 %525, ptr %NEXT_PC, align 8
  store ptr %519, ptr %MEMORY, align 8
  %526 = load i8, ptr %BRANCH_TAKEN, align 1
  %527 = icmp eq i8 %526, 1
  br i1 %527, label %528, label %537

528:                                              ; preds = %537, %513
  %529 = load i64, ptr %NEXT_PC, align 8
  store i64 %529, ptr %PC, align 8
  %530 = add i64 %529, 1
  store i64 %530, ptr %NEXT_PC, align 8
  %531 = load ptr, ptr %MEMORY, align 8
  %532 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 15
  %533 = load i64, ptr %532, align 8
  %534 = call i64 @__remill_read_memory_64(ptr noundef %531, i64 noundef %533) #3
  store i64 %534, ptr %532, align 8
  %535 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %536 = add i64 %533, 8
  store i64 %536, ptr %535, align 8
  store ptr %531, ptr %MEMORY, align 8
  br label %553

537:                                              ; preds = %513
  %538 = load i64, ptr %NEXT_PC, align 8
  store i64 %538, ptr %PC, align 8
  %539 = add i64 %538, 5
  store i64 %539, ptr %NEXT_PC, align 8
  %540 = load i64, ptr %NEXT_PC, align 8
  %541 = sub i64 %540, 391
  %542 = load i64, ptr %NEXT_PC, align 8
  %543 = load ptr, ptr %MEMORY, align 8
  %544 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %545 = load i64, ptr %544, align 8
  %546 = add i64 %545, -8
  %547 = call ptr @__remill_write_memory_64(ptr noundef %543, i64 noundef %546, i64 noundef %542) #3
  store i64 %546, ptr %544, align 8
  %548 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %541, ptr %548, align 8
  store i64 %541, ptr %NEXT_PC, align 8
  store i64 %542, ptr %RETURN_PC, align 8
  store ptr %547, ptr %MEMORY, align 8
  %549 = load ptr, ptr %MEMORY, align 8
  %550 = load i64, ptr %PC, align 8
  %551 = call ptr @EXTERNAL.__stack_chk_fail(ptr %state, i64 %550, ptr %549)
  %552 = load i64, ptr %RETURN_PC, align 8
  store i64 %552, ptr %NEXT_PC, align 8
  br label %528

553:                                              ; preds = %528
  %554 = load i64, ptr %NEXT_PC, align 8
  store i64 %554, ptr %PC, align 8
  %555 = add i64 %554, 1
  store i64 %555, ptr %NEXT_PC, align 8
  %556 = load ptr, ptr %MEMORY, align 8
  %557 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %558 = load i64, ptr %557, align 8
  %559 = call i64 @__remill_read_memory_64(ptr noundef %556, i64 noundef %558) #3
  %560 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %559, ptr %560, align 8
  store i64 %559, ptr %NEXT_PC, align 8
  %561 = load i64, ptr %557, align 8
  %562 = add i64 %561, 8
  store i64 %562, ptr %557, align 8
  store ptr %556, ptr %MEMORY, align 8
  %563 = load i64, ptr %NEXT_PC, align 8
  store i64 %563, ptr %PC, align 8
  %564 = load ptr, ptr %MEMORY, align 8
  %565 = load i64, ptr %PC, align 8
  %566 = tail call ptr @__remill_function_return(ptr %state, i64 %565, ptr %564)
  ret ptr %566
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
  %158 = add i64 %157, 12115
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
  %2 = call ptr @LIFTED.main(ptr @LIFTED.STATE, i64 4425, ptr %1)
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
