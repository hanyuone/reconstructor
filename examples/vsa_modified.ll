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
  %78 = load ptr, ptr %MEMORY, align 8
  store i64 0, ptr %RAX, align 8
  store ptr %78, ptr %MEMORY, align 8
  br label %79

79:                                              ; preds = %75
  %80 = load i64, ptr %NEXT_PC, align 8
  store i64 %80, ptr %PC, align 8
  %81 = add i64 %80, 7
  store i64 %81, ptr %NEXT_PC, align 8
  %82 = load i64, ptr %RBP, align 8
  %83 = sub i64 %82, 80
  %84 = load ptr, ptr %MEMORY, align 8
  %85 = call ptr @__remill_write_memory_32(ptr noundef %84, i64 noundef %83, i32 noundef 5) #3
  store ptr %85, ptr %MEMORY, align 8
  br label %86

86:                                              ; preds = %79
  %87 = load i64, ptr %NEXT_PC, align 8
  store i64 %87, ptr %PC, align 8
  %88 = add i64 %87, 7
  store i64 %88, ptr %NEXT_PC, align 8
  %89 = load i64, ptr %RBP, align 8
  %90 = sub i64 %89, 76
  %91 = load ptr, ptr %MEMORY, align 8
  %92 = call ptr @__remill_write_memory_32(ptr noundef %91, i64 noundef %90, i32 noundef 10) #3
  store ptr %92, ptr %MEMORY, align 8
  br label %93

93:                                              ; preds = %86
  %94 = load i64, ptr %NEXT_PC, align 8
  store i64 %94, ptr %PC, align 8
  %95 = add i64 %94, 7
  store i64 %95, ptr %NEXT_PC, align 8
  %96 = load i64, ptr %RBP, align 8
  %97 = sub i64 %96, 84
  %98 = load ptr, ptr %MEMORY, align 8
  %99 = call ptr @__remill_write_memory_32(ptr noundef %98, i64 noundef %97, i32 noundef 0) #3
  store ptr %99, ptr %MEMORY, align 8
  br label %100

100:                                              ; preds = %93
  %101 = load i64, ptr %NEXT_PC, align 8
  store i64 %101, ptr %PC, align 8
  %102 = add i64 %101, 4
  store i64 %102, ptr %NEXT_PC, align 8
  %103 = load i64, ptr %RBP, align 8
  %104 = sub i64 %103, 48
  %105 = load ptr, ptr %MEMORY, align 8
  store i64 %104, ptr %RAX, align 8
  store ptr %105, ptr %MEMORY, align 8
  br label %106

106:                                              ; preds = %100
  %107 = load i64, ptr %NEXT_PC, align 8
  store i64 %107, ptr %PC, align 8
  %108 = add i64 %107, 4
  store i64 %108, ptr %NEXT_PC, align 8
  %109 = load i64, ptr %RBP, align 8
  %110 = sub i64 %109, 72
  %111 = load i64, ptr %RAX, align 8
  %112 = load ptr, ptr %MEMORY, align 8
  %113 = call ptr @__remill_write_memory_64(ptr noundef %112, i64 noundef %110, i64 noundef %111) #3
  store ptr %113, ptr %MEMORY, align 8
  br label %114

114:                                              ; preds = %106
  %115 = load i64, ptr %NEXT_PC, align 8
  store i64 %115, ptr %PC, align 8
  %116 = add i64 %115, 4
  store i64 %116, ptr %NEXT_PC, align 8
  %117 = load i64, ptr %RBP, align 8
  %118 = sub i64 %117, 72
  %119 = load ptr, ptr %MEMORY, align 8
  %120 = call i64 @__remill_read_memory_64(ptr noundef %119, i64 noundef %118) #3
  store i64 %120, ptr %RAX, align 8
  store ptr %119, ptr %MEMORY, align 8
  br label %121

121:                                              ; preds = %114
  %122 = load i64, ptr %NEXT_PC, align 8
  store i64 %122, ptr %PC, align 8
  %123 = add i64 %122, 4
  store i64 %123, ptr %NEXT_PC, align 8
  %124 = load i64, ptr %RBP, align 8
  %125 = sub i64 %124, 56
  %126 = load i64, ptr %RAX, align 8
  %127 = load ptr, ptr %MEMORY, align 8
  %128 = call ptr @__remill_write_memory_64(ptr noundef %127, i64 noundef %125, i64 noundef %126) #3
  store ptr %128, ptr %MEMORY, align 8
  br label %129

129:                                              ; preds = %121
  %130 = load i64, ptr %NEXT_PC, align 8
  store i64 %130, ptr %PC, align 8
  %131 = add i64 %130, 4
  store i64 %131, ptr %NEXT_PC, align 8
  %132 = load i64, ptr %RBP, align 8
  %133 = sub i64 %132, 48
  %134 = load ptr, ptr %MEMORY, align 8
  store i64 %133, ptr %RAX, align 8
  store ptr %134, ptr %MEMORY, align 8
  br label %135

135:                                              ; preds = %129
  %136 = load i64, ptr %NEXT_PC, align 8
  store i64 %136, ptr %PC, align 8
  %137 = add i64 %136, 4
  store i64 %137, ptr %NEXT_PC, align 8
  %138 = load i64, ptr %RAX, align 8
  %139 = load ptr, ptr %MEMORY, align 8
  %140 = add i64 20, %138
  store i64 %140, ptr %RAX, align 8
  %141 = icmp ult i64 %140, %138
  %142 = icmp ult i64 %140, 20
  %143 = or i1 %141, %142
  %144 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %143, i64 noundef %138, i64 noundef 20, i64 noundef %140) #3
  %145 = zext i1 %144 to i8
  %146 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %145, ptr %146, align 1
  %147 = trunc i64 %140 to i8
  %148 = call i8 @llvm.ctpop.i8(i8 %147)
  %149 = and i8 %148, 1
  %150 = xor i8 %149, 1
  %151 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %150, ptr %151, align 1
  %152 = xor i64 %140, %138
  %153 = xor i64 %152, 20
  %154 = trunc i64 %153 to i8
  %155 = lshr i8 %154, 4
  %156 = and i8 %155, 1
  %157 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %156, ptr %157, align 1
  %158 = icmp eq i64 %140, 0
  %159 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %158, i64 noundef %138, i64 noundef 20, i64 noundef %140) #3
  %160 = zext i1 %159 to i8
  %161 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %160, ptr %161, align 1
  %162 = icmp slt i64 %140, 0
  %163 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %162, i64 noundef %138, i64 noundef 20, i64 noundef %140) #3
  %164 = zext i1 %163 to i8
  %165 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %164, ptr %165, align 1
  %166 = lshr i64 %152, 63
  %167 = xor i64 %140, 20
  %168 = lshr i64 %167, 63
  %169 = add nuw nsw i64 %166, %168
  %170 = icmp eq i64 %169, 2
  %171 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %170, i64 noundef %138, i64 noundef 20, i64 noundef %140) #3
  %172 = zext i1 %171 to i8
  %173 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %172, ptr %173, align 1
  store ptr %139, ptr %MEMORY, align 8
  br label %174

174:                                              ; preds = %135
  %175 = load i64, ptr %NEXT_PC, align 8
  store i64 %175, ptr %PC, align 8
  %176 = add i64 %175, 4
  store i64 %176, ptr %NEXT_PC, align 8
  %177 = load i64, ptr %RBP, align 8
  %178 = sub i64 %177, 64
  %179 = load i64, ptr %RAX, align 8
  %180 = load ptr, ptr %MEMORY, align 8
  %181 = call ptr @__remill_write_memory_64(ptr noundef %180, i64 noundef %178, i64 noundef %179) #3
  store ptr %181, ptr %MEMORY, align 8
  br label %182

182:                                              ; preds = %174
  %183 = load i64, ptr %NEXT_PC, align 8
  store i64 %183, ptr %PC, align 8
  %184 = add i64 %183, 2
  store i64 %184, ptr %NEXT_PC, align 8
  %185 = load i64, ptr %NEXT_PC, align 8
  %186 = add i64 %185, 32
  %187 = load ptr, ptr %MEMORY, align 8
  %188 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %186, ptr %188, align 8
  store i64 %186, ptr %NEXT_PC, align 8
  store ptr %187, ptr %MEMORY, align 8
  br label %189

189:                                              ; preds = %345, %182
  %190 = load i64, ptr %NEXT_PC, align 8
  store i64 %190, ptr %PC, align 8
  %191 = add i64 %190, 4
  store i64 %191, ptr %NEXT_PC, align 8
  %192 = load i64, ptr %RBP, align 8
  %193 = sub i64 %192, 84
  %194 = load ptr, ptr %MEMORY, align 8
  %195 = call i32 @__remill_read_memory_32(ptr noundef %194, i64 noundef %193) #3
  %cmp.0 = icmp sle i32 %195, 4
  store ptr %194, ptr %MEMORY, align 8

  %196 = load i64, ptr %NEXT_PC, align 8
  store i64 %196, ptr %PC, align 8
  %197 = add i64 %196, 2
  store i64 %197, ptr %NEXT_PC, align 8
  %198 = load i64, ptr %NEXT_PC, align 8
  %199 = sub i64 %198, 38
  %200 = load i64, ptr %NEXT_PC, align 8
  %201 = load ptr, ptr %MEMORY, align 8
  %202 = call zeroext i1 @__remill_compare_sle(i1 noundef zeroext %cmp.0) #4
  %203 = select i1 %cmp.0, i64 %199, i64 %200
  store i64 %203, ptr %NEXT_PC, align 8
  store ptr %201, ptr %MEMORY, align 8
  br i1 %cmp.0, label %204, label %211

204:                                              ; preds = %228
  %205 = load i64, ptr %NEXT_PC, align 8
  store i64 %205, ptr %PC, align 8
  %206 = add i64 %205, 4
  store i64 %206, ptr %NEXT_PC, align 8
  %207 = load i64, ptr %RBP, align 8
  %208 = sub i64 %207, 72
  %209 = load ptr, ptr %MEMORY, align 8
  %210 = call i64 @__remill_read_memory_64(ptr noundef %209, i64 noundef %208) #3
  store i64 %210, ptr %RAX, align 8
  store ptr %209, ptr %MEMORY, align 8
  br label %218

211:                                              ; preds = %228
  %212 = load i64, ptr %NEXT_PC, align 8
  store i64 %212, ptr %PC, align 8
  %213 = add i64 %212, 4
  store i64 %213, ptr %NEXT_PC, align 8
  %214 = load i64, ptr %RBP, align 8
  %215 = sub i64 %214, 56
  %216 = load ptr, ptr %MEMORY, align 8
  %217 = call i64 @__remill_read_memory_64(ptr noundef %216, i64 noundef %215) #3
  store i64 %217, ptr %RAX, align 8
  store ptr %216, ptr %MEMORY, align 8
  br label %389

218:                                              ; preds = %204
  %219 = load i64, ptr %NEXT_PC, align 8
  store i64 %219, ptr %PC, align 8
  %220 = add i64 %219, 3
  store i64 %220, ptr %NEXT_PC, align 8
  %221 = load i64, ptr %RBP, align 8
  %222 = sub i64 %221, 80
  %223 = load ptr, ptr %MEMORY, align 8
  %224 = call i32 @__remill_read_memory_32(ptr noundef %223, i64 noundef %222) #3
  %225 = zext i32 %224 to i64
  store i64 %225, ptr %RDX, align 8
  store ptr %223, ptr %MEMORY, align 8
  br label %226

226:                                              ; preds = %218
  %227 = load i64, ptr %NEXT_PC, align 8
  store i64 %227, ptr %PC, align 8
  %228 = add i64 %227, 2
  store i64 %228, ptr %NEXT_PC, align 8
  %229 = load i64, ptr %RAX, align 8
  %230 = load i32, ptr %EDX, align 4
  %231 = zext i32 %230 to i64
  %232 = load ptr, ptr %MEMORY, align 8
  %233 = call ptr @__remill_write_memory_32(ptr noundef %232, i64 noundef %229, i32 noundef %230) #3
  store ptr %233, ptr %MEMORY, align 8
  br label %234

234:                                              ; preds = %226
  %235 = load i64, ptr %NEXT_PC, align 8
  store i64 %235, ptr %PC, align 8
  %236 = add i64 %235, 4
  store i64 %236, ptr %NEXT_PC, align 8
  %237 = load i64, ptr %RBP, align 8
  %238 = sub i64 %237, 64
  %239 = load ptr, ptr %MEMORY, align 8
  %240 = call i64 @__remill_read_memory_64(ptr noundef %239, i64 noundef %238) #3
  store i64 %240, ptr %RAX, align 8
  store ptr %239, ptr %MEMORY, align 8
  br label %241

241:                                              ; preds = %234
  %242 = load i64, ptr %NEXT_PC, align 8
  store i64 %242, ptr %PC, align 8
  %243 = add i64 %242, 3
  store i64 %243, ptr %NEXT_PC, align 8
  %244 = load i64, ptr %RBP, align 8
  %245 = sub i64 %244, 76
  %246 = load ptr, ptr %MEMORY, align 8
  %247 = call i32 @__remill_read_memory_32(ptr noundef %246, i64 noundef %245) #3
  %248 = zext i32 %247 to i64
  store i64 %248, ptr %RDX, align 8
  store ptr %246, ptr %MEMORY, align 8
  br label %249

249:                                              ; preds = %241
  %250 = load i64, ptr %NEXT_PC, align 8
  store i64 %250, ptr %PC, align 8
  %251 = add i64 %250, 2
  store i64 %251, ptr %NEXT_PC, align 8
  %252 = load i64, ptr %RAX, align 8
  %253 = load i32, ptr %EDX, align 4
  %254 = zext i32 %253 to i64
  %255 = load ptr, ptr %MEMORY, align 8
  %256 = call ptr @__remill_write_memory_32(ptr noundef %255, i64 noundef %252, i32 noundef %253) #3
  store ptr %256, ptr %MEMORY, align 8
  br label %257

257:                                              ; preds = %249
  %258 = load i64, ptr %NEXT_PC, align 8
  store i64 %258, ptr %PC, align 8
  %259 = add i64 %258, 5
  store i64 %259, ptr %NEXT_PC, align 8
  %260 = load i64, ptr %RBP, align 8
  %261 = sub i64 %260, 72
  %262 = load i64, ptr %RBP, align 8
  %263 = sub i64 %262, 72
  %264 = load ptr, ptr %MEMORY, align 8
  %265 = call i64 @__remill_read_memory_64(ptr noundef %264, i64 noundef %263) #3
  %266 = add i64 %265, 4
  %267 = call ptr @__remill_write_memory_64(ptr noundef %264, i64 noundef %261, i64 noundef %266) #3
  %268 = icmp ult i64 %266, %265
  %269 = icmp ult i64 %266, 4
  %270 = or i1 %268, %269
  %271 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %270, i64 noundef %265, i64 noundef 4, i64 noundef %266) #3
  %272 = zext i1 %271 to i8
  %273 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %272, ptr %273, align 1
  %274 = trunc i64 %266 to i8
  %275 = call i8 @llvm.ctpop.i8(i8 %274)
  %276 = and i8 %275, 1
  %277 = xor i8 %276, 1
  %278 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %277, ptr %278, align 1
  %279 = xor i64 %266, %265
  %280 = xor i64 %279, 4
  %281 = trunc i64 %280 to i8
  %282 = lshr i8 %281, 4
  %283 = and i8 %282, 1
  %284 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %283, ptr %284, align 1
  %285 = icmp eq i64 %266, 0
  %286 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %285, i64 noundef %265, i64 noundef 4, i64 noundef %266) #3
  %287 = zext i1 %286 to i8
  %288 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %287, ptr %288, align 1
  %289 = icmp slt i64 %266, 0
  %290 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %289, i64 noundef %265, i64 noundef 4, i64 noundef %266) #3
  %291 = zext i1 %290 to i8
  %292 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %291, ptr %292, align 1
  %293 = lshr i64 %279, 63
  %294 = xor i64 %266, 4
  %295 = lshr i64 %294, 63
  %296 = add nuw nsw i64 %293, %295
  %297 = icmp eq i64 %296, 2
  %298 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %297, i64 noundef %265, i64 noundef 4, i64 noundef %266) #3
  %299 = zext i1 %298 to i8
  %300 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %299, ptr %300, align 1
  store ptr %267, ptr %MEMORY, align 8
  br label %301

301:                                              ; preds = %257
  %302 = load i64, ptr %NEXT_PC, align 8
  store i64 %302, ptr %PC, align 8
  %303 = add i64 %302, 5
  store i64 %303, ptr %NEXT_PC, align 8
  %304 = load i64, ptr %RBP, align 8
  %305 = sub i64 %304, 64
  %306 = load i64, ptr %RBP, align 8
  %307 = sub i64 %306, 64
  %308 = load ptr, ptr %MEMORY, align 8
  %309 = call i64 @__remill_read_memory_64(ptr noundef %308, i64 noundef %307) #3
  %310 = add i64 %309, 4
  %311 = call ptr @__remill_write_memory_64(ptr noundef %308, i64 noundef %305, i64 noundef %310) #3
  %312 = icmp ult i64 %310, %309
  %313 = icmp ult i64 %310, 4
  %314 = or i1 %312, %313
  %315 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %314, i64 noundef %309, i64 noundef 4, i64 noundef %310) #3
  %316 = zext i1 %315 to i8
  %317 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %316, ptr %317, align 1
  %318 = trunc i64 %310 to i8
  %319 = call i8 @llvm.ctpop.i8(i8 %318)
  %320 = and i8 %319, 1
  %321 = xor i8 %320, 1
  %322 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %321, ptr %322, align 1
  %323 = xor i64 %310, %309
  %324 = xor i64 %323, 4
  %325 = trunc i64 %324 to i8
  %326 = lshr i8 %325, 4
  %327 = and i8 %326, 1
  %328 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %327, ptr %328, align 1
  %329 = icmp eq i64 %310, 0
  %330 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %329, i64 noundef %309, i64 noundef 4, i64 noundef %310) #3
  %331 = zext i1 %330 to i8
  %332 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %331, ptr %332, align 1
  %333 = icmp slt i64 %310, 0
  %334 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %333, i64 noundef %309, i64 noundef 4, i64 noundef %310) #3
  %335 = zext i1 %334 to i8
  %336 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %335, ptr %336, align 1
  %337 = lshr i64 %323, 63
  %338 = xor i64 %310, 4
  %339 = lshr i64 %338, 63
  %340 = add nuw nsw i64 %337, %339
  %341 = icmp eq i64 %340, 2
  %342 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %341, i64 noundef %309, i64 noundef 4, i64 noundef %310) #3
  %343 = zext i1 %342 to i8
  %344 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %343, ptr %344, align 1
  store ptr %311, ptr %MEMORY, align 8
  br label %345

345:                                              ; preds = %301
  %346 = load i64, ptr %NEXT_PC, align 8
  store i64 %346, ptr %PC, align 8
  %347 = add i64 %346, 4
  store i64 %347, ptr %NEXT_PC, align 8
  %348 = load i64, ptr %RBP, align 8
  %349 = sub i64 %348, 84
  %350 = load i64, ptr %RBP, align 8
  %351 = sub i64 %350, 84
  %352 = load ptr, ptr %MEMORY, align 8
  %353 = call i32 @__remill_read_memory_32(ptr noundef %352, i64 noundef %351) #3
  %354 = add i32 %353, 1
  %355 = call ptr @__remill_write_memory_32(ptr noundef %352, i64 noundef %349, i32 noundef %354) #3
  %356 = icmp ult i32 %354, %353
  %357 = icmp ult i32 %354, 1
  %358 = or i1 %356, %357
  %359 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %358, i32 noundef %353, i32 noundef 1, i32 noundef %354) #3
  %360 = zext i1 %359 to i8
  %361 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %360, ptr %361, align 1
  %362 = trunc i32 %354 to i8
  %363 = call i8 @llvm.ctpop.i8(i8 %362)
  %364 = and i8 %363, 1
  %365 = xor i8 %364, 1
  %366 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %365, ptr %366, align 1
  %367 = xor i32 %354, %353
  %368 = xor i32 %367, 1
  %369 = trunc i32 %368 to i8
  %370 = lshr i8 %369, 4
  %371 = and i8 %370, 1
  %372 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %371, ptr %372, align 1
  %373 = icmp eq i32 %354, 0
  %374 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %373, i32 noundef %353, i32 noundef 1, i32 noundef %354) #3
  %375 = zext i1 %374 to i8
  %376 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %375, ptr %376, align 1
  %377 = icmp slt i32 %354, 0
  %378 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %377, i32 noundef %353, i32 noundef 1, i32 noundef %354) #3
  %379 = zext i1 %378 to i8
  %380 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %379, ptr %380, align 1
  %381 = lshr i32 %367, 31
  %382 = xor i32 %354, 1
  %383 = lshr i32 %382, 31
  %384 = add nuw nsw i32 %381, %383
  %385 = icmp eq i32 %384, 2
  %386 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %385, i32 noundef %353, i32 noundef 1, i32 noundef %354) #3
  %387 = zext i1 %386 to i8
  %388 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %387, ptr %388, align 1
  store ptr %355, ptr %MEMORY, align 8
  br label %189

389:                                              ; preds = %211
  %390 = load i64, ptr %NEXT_PC, align 8
  store i64 %390, ptr %PC, align 8
  %391 = add i64 %390, 2
  store i64 %391, ptr %NEXT_PC, align 8
  %392 = load i64, ptr %RAX, align 8
  %393 = load ptr, ptr %MEMORY, align 8
  %394 = call i32 @__remill_read_memory_32(ptr noundef %393, i64 noundef %392) #3
  %395 = zext i32 %394 to i64
  store i64 %395, ptr %RAX, align 8
  store ptr %393, ptr %MEMORY, align 8
  br label %396

396:                                              ; preds = %389
  %397 = load i64, ptr %NEXT_PC, align 8
  store i64 %397, ptr %PC, align 8
  %398 = add i64 %397, 4
  store i64 %398, ptr %NEXT_PC, align 8
  %399 = load i64, ptr %RBP, align 8
  %400 = sub i64 %399, 8
  %401 = load ptr, ptr %MEMORY, align 8
  %402 = call i64 @__remill_read_memory_64(ptr noundef %401, i64 noundef %400) #3
  store i64 %402, ptr %RDX, align 8
  store ptr %401, ptr %MEMORY, align 8
  br label %403

403:                                              ; preds = %396
  %404 = load i64, ptr %NEXT_PC, align 8
  store i64 %404, ptr %PC, align 8
  %405 = add i64 %404, 9
  store i64 %405, ptr %NEXT_PC, align 8
  %406 = load i64, ptr %RDX, align 8
  %407 = load i64, ptr %FSBASE, align 8
  %408 = add i64 40, %407
  %409 = load ptr, ptr %MEMORY, align 8
  %410 = call i64 @__remill_read_memory_64(ptr noundef %409, i64 noundef %408) #3
  %411 = sub i64 %406, %410
  store i64 %411, ptr %RDX, align 8
  %cmp.1 = icmp eq i64 %411, 0
  store ptr %409, ptr %MEMORY, align 8

  %412 = load i64, ptr %NEXT_PC, align 8
  store i64 %412, ptr %PC, align 8
  %413 = add i64 %412, 2
  store i64 %413, ptr %NEXT_PC, align 8
  %414 = load i64, ptr %NEXT_PC, align 8
  %415 = add i64 %414, 5
  %416 = load i64, ptr %NEXT_PC, align 8
  %417 = load ptr, ptr %MEMORY, align 8
  %418 = call zeroext i1 @__remill_compare_eq(i1 noundef zeroext %cmp.1) #4
  %419 = select i1 %cmp.1, i64 %415, i64 %416
  store i64 %419, ptr %NEXT_PC, align 8
  store ptr %417, ptr %MEMORY, align 8
  br i1 %cmp.1, label %420, label %429

420:                                              ; preds = %429, %443
  %421 = load i64, ptr %NEXT_PC, align 8
  store i64 %421, ptr %PC, align 8
  %422 = add i64 %421, 1
  store i64 %422, ptr %NEXT_PC, align 8
  %423 = load ptr, ptr %MEMORY, align 8
  %424 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 15
  %425 = load i64, ptr %424, align 8
  %426 = call i64 @__remill_read_memory_64(ptr noundef %423, i64 noundef %425) #3
  store i64 %426, ptr %424, align 8
  %427 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %428 = add i64 %425, 8
  store i64 %428, ptr %427, align 8
  store ptr %423, ptr %MEMORY, align 8
  br label %445

429:                                              ; preds = %443
  %430 = load i64, ptr %NEXT_PC, align 8
  store i64 %430, ptr %PC, align 8
  %431 = add i64 %430, 5
  store i64 %431, ptr %NEXT_PC, align 8
  %432 = load i64, ptr %NEXT_PC, align 8
  %433 = sub i64 %432, 391
  %434 = load i64, ptr %NEXT_PC, align 8
  %435 = load ptr, ptr %MEMORY, align 8
  %436 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %437 = load i64, ptr %436, align 8
  %438 = add i64 %437, -8
  %439 = call ptr @__remill_write_memory_64(ptr noundef %435, i64 noundef %438, i64 noundef %434) #3
  store i64 %438, ptr %436, align 8
  %440 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %433, ptr %440, align 8
  store i64 %433, ptr %NEXT_PC, align 8
  store i64 %434, ptr %RETURN_PC, align 8
  store ptr %439, ptr %MEMORY, align 8
  %441 = load ptr, ptr %MEMORY, align 8
  %442 = load i64, ptr %PC, align 8
  %443 = call ptr @EXTERNAL.__stack_chk_fail(ptr %state, i64 %442, ptr %441)
  %444 = load i64, ptr %RETURN_PC, align 8
  store i64 %444, ptr %NEXT_PC, align 8
  br label %420

445:                                              ; preds = %420
  %446 = load i64, ptr %NEXT_PC, align 8
  store i64 %446, ptr %PC, align 8
  %447 = add i64 %446, 1
  store i64 %447, ptr %NEXT_PC, align 8
  %448 = load ptr, ptr %MEMORY, align 8
  %449 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %450 = load i64, ptr %449, align 8
  %451 = call i64 @__remill_read_memory_64(ptr noundef %448, i64 noundef %450) #3
  %452 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %451, ptr %452, align 8
  store i64 %451, ptr %NEXT_PC, align 8
  %453 = load i64, ptr %449, align 8
  %454 = add i64 %453, 8
  store i64 %454, ptr %449, align 8
  store ptr %448, ptr %MEMORY, align 8
  %455 = load i64, ptr %NEXT_PC, align 8
  store i64 %455, ptr %PC, align 8
  %456 = load ptr, ptr %MEMORY, align 8
  %457 = load i64, ptr %PC, align 8
  %458 = tail call ptr @__remill_function_return(ptr %state, i64 %457, ptr %456)
  ret ptr %458
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
