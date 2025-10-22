; ModuleID = 'reverse_list.ll'
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
  %EAX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0
  %RSI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 9, i32 0, i32 0
  %RDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
  %RAX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0
  %RDI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 11, i32 0, i32 0
  %RSP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 13, i32 0, i32 0
  %RBP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 15, i32 0, i32 0
  %EDI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 11, i32 0, i32 0
  %EDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
  %PC = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 33, i32 0, i32 0
  br label %1

1:                                                ; preds = %0
  store i64 %program_counter, ptr %PC, align 8
  %2 = add i64 %program_counter, 4
  %3 = load i32, ptr %EDX, align 4
  %4 = zext i32 %3 to i64
  %5 = load i32, ptr %EDI, align 4
  %6 = zext i32 %5 to i64
  br label %7

7:                                                ; preds = %1
  store i64 %2, ptr %PC, align 8
  %8 = add i64 %2, 1
  %9 = load i64, ptr %RBP, align 8
  %10 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %11 = load i64, ptr %10, align 8
  %12 = add i64 %11, -8
  %13 = call ptr @__remill_write_memory_64(ptr noundef %memory, i64 noundef %12, i64 noundef %9) #3
  store i64 %12, ptr %10, align 8
  br label %14

14:                                               ; preds = %7
  store i64 %8, ptr %PC, align 8
  %15 = add i64 %8, 3
  %16 = load i64, ptr %RSP, align 8
  store i64 %16, ptr %RBP, align 8
  br label %17

17:                                               ; preds = %14
  store i64 %15, ptr %PC, align 8
  %18 = add i64 %15, 4
  %19 = load i64, ptr %RSP, align 8
  %20 = sub i64 %19, 48
  store i64 %20, ptr %RSP, align 8
  %21 = icmp ult i64 %19, 48
  %22 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %21, i64 noundef %19, i64 noundef 48, i64 noundef %20) #3
  %23 = zext i1 %22 to i8
  %24 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %23, ptr %24, align 1
  %25 = trunc i64 %20 to i8
  %26 = call i8 @llvm.ctpop.i8(i8 %25)
  %27 = and i8 %26, 1
  %28 = xor i8 %27, 1
  %29 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %28, ptr %29, align 1
  %30 = xor i64 48, %19
  %31 = xor i64 %30, %20
  %32 = trunc i64 %31 to i8
  %33 = lshr i8 %32, 4
  %34 = and i8 %33, 1
  %35 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %34, ptr %35, align 1
  %36 = icmp eq i64 %19, 48
  %37 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %36, i64 noundef %19, i64 noundef 48, i64 noundef %20) #3
  %38 = zext i1 %37 to i8
  %39 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %38, ptr %39, align 1
  %40 = icmp slt i64 %20, 0
  %41 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %40, i64 noundef %19, i64 noundef 48, i64 noundef %20) #3
  %42 = zext i1 %41 to i8
  %43 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %42, ptr %43, align 1
  %44 = lshr i64 %30, 63
  %45 = xor i64 %20, %19
  %46 = lshr i64 %45, 63
  %47 = add nuw nsw i64 %46, %44
  %48 = icmp eq i64 %47, 2
  %49 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %48, i64 noundef %19, i64 noundef 48, i64 noundef %20) #3
  %50 = zext i1 %49 to i8
  %51 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %50, ptr %51, align 1
  br label %52

52:                                               ; preds = %17
  store i64 %18, ptr %PC, align 8
  %53 = add i64 %18, 8
  %54 = load i64, ptr %RBP, align 8
  %55 = sub i64 %54, 32
  %56 = call ptr @__remill_write_memory_64(ptr noundef %13, i64 noundef %55, i64 noundef 0) #3
  br label %57

57:                                               ; preds = %52
  store i64 %53, ptr %PC, align 8
  %58 = add i64 %53, 7
  %59 = load i64, ptr %RBP, align 8
  %60 = sub i64 %59, 36
  %61 = call ptr @__remill_write_memory_32(ptr noundef %56, i64 noundef %60, i32 noundef 0) #3
  br label %62

62:                                               ; preds = %57
  store i64 %58, ptr %PC, align 8
  %63 = add i64 %58, 2
  %64 = add i64 %63, 47
  %65 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %64, ptr %65, align 8
  br label %66

66:                                               ; preds = %188, %62
  %MEMORY.0 = phi ptr [ %61, %62 ], [ %196, %188 ]
  %NEXT_PC.0 = phi i64 [ %64, %62 ], [ %189, %188 ]
  store i64 %NEXT_PC.0, ptr %PC, align 8
  %67 = add i64 %NEXT_PC.0, 4
  %68 = load i64, ptr %RBP, align 8
  %69 = sub i64 %68, 36
  %70 = call i32 @__remill_read_memory_32(ptr noundef %MEMORY.0, i64 noundef %69) #3
  %71 = sub i32 %70, 4
  %72 = icmp ult i32 %70, 4
  %73 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %72, i32 noundef %70, i32 noundef 4, i32 noundef %71) #3
  %74 = zext i1 %73 to i8
  %75 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %74, ptr %75, align 1
  %76 = trunc i32 %71 to i8
  %77 = call i8 @llvm.ctpop.i8(i8 %76)
  %78 = and i8 %77, 1
  %79 = xor i8 %78, 1
  %80 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %79, ptr %80, align 1
  %81 = xor i32 %70, 4
  %82 = xor i32 %81, %71
  %83 = trunc i32 %82 to i8
  %84 = lshr i8 %83, 4
  %85 = and i8 %84, 1
  %86 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %85, ptr %86, align 1
  %87 = icmp eq i32 %70, 4
  %88 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %87, i32 noundef %70, i32 noundef 4, i32 noundef %71) #3
  %89 = zext i1 %88 to i8
  %90 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %89, ptr %90, align 1
  %91 = icmp slt i32 %71, 0
  %92 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %91, i32 noundef %70, i32 noundef 4, i32 noundef %71) #3
  %93 = zext i1 %92 to i8
  %94 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %93, ptr %94, align 1
  %95 = lshr i32 %81, 31
  %96 = xor i32 %71, %70
  %97 = lshr i32 %96, 31
  %98 = add nuw nsw i32 %97, %95
  %99 = icmp eq i32 %98, 2
  %100 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %99, i32 noundef %70, i32 noundef 4, i32 noundef %71) #3
  %101 = zext i1 %100 to i8
  %102 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %101, ptr %102, align 1
  br label %103

103:                                              ; preds = %66
  store i64 %67, ptr %PC, align 8
  %104 = add i64 %67, 2
  %105 = sub i64 %104, 53
  %106 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %107 = load i8, ptr %106, align 1
  %108 = icmp ne i8 %107, 0
  %109 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  %110 = load i8, ptr %109, align 1
  %111 = icmp ne i8 %110, 0
  %112 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  %113 = load i8, ptr %112, align 1
  %114 = icmp ne i8 %113, 0
  %115 = xor i1 %111, %114
  %116 = or i1 %108, %115
  %117 = call zeroext i1 @__remill_compare_sle(i1 noundef zeroext %116) #4
  %118 = zext i1 %117 to i8
  %119 = select i1 %117, i64 %105, i64 %104
  %120 = icmp eq i8 %118, 1
  br i1 %120, label %121, label %123

121:                                              ; preds = %103
  store i64 %119, ptr %PC, align 8
  %122 = add i64 %119, 5
  store i64 16, ptr %RDI, align 8
  br label %128

123:                                              ; preds = %103
  store i64 %119, ptr %PC, align 8
  %124 = add i64 %119, 4
  %125 = load i64, ptr %RBP, align 8
  %126 = sub i64 %125, 32
  %127 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.0, i64 noundef %126) #3
  store i64 %127, ptr %RAX, align 8
  br label %230

128:                                              ; preds = %121
  store i64 %122, ptr %PC, align 8
  %129 = add i64 %122, 5
  %130 = sub i64 %129, 288
  %131 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %132 = load i64, ptr %131, align 8
  %133 = add i64 %132, -8
  %134 = call ptr @__remill_write_memory_64(ptr noundef %MEMORY.0, i64 noundef %133, i64 noundef %129) #3
  store i64 %133, ptr %131, align 8
  %135 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %130, ptr %135, align 8
  %136 = load i64, ptr %PC, align 8
  %137 = call ptr @EXTERNAL.malloc(ptr %state, i64 %136, ptr %134)
  br label %138

138:                                              ; preds = %128
  store i64 %129, ptr %PC, align 8
  %139 = add i64 %129, 4
  %140 = load i64, ptr %RBP, align 8
  %141 = sub i64 %140, 8
  %142 = load i64, ptr %RAX, align 8
  %143 = call ptr @__remill_write_memory_64(ptr noundef %134, i64 noundef %141, i64 noundef %142) #3
  br label %144

144:                                              ; preds = %138
  store i64 %139, ptr %PC, align 8
  %145 = add i64 %139, 4
  %146 = load i64, ptr %RBP, align 8
  %147 = sub i64 %146, 8
  %148 = call i64 @__remill_read_memory_64(ptr noundef %143, i64 noundef %147) #3
  store i64 %148, ptr %RAX, align 8
  br label %149

149:                                              ; preds = %144
  store i64 %145, ptr %PC, align 8
  %150 = add i64 %145, 4
  %151 = load i64, ptr %RBP, align 8
  %152 = sub i64 %151, 32
  %153 = call i64 @__remill_read_memory_64(ptr noundef %143, i64 noundef %152) #3
  store i64 %153, ptr %RDX, align 8
  br label %154

154:                                              ; preds = %149
  store i64 %150, ptr %PC, align 8
  %155 = add i64 %150, 3
  %156 = load i64, ptr %RAX, align 8
  %157 = load i64, ptr %RDX, align 8
  %158 = call ptr @__remill_write_memory_64(ptr noundef %143, i64 noundef %156, i64 noundef %157) #3
  br label %159

159:                                              ; preds = %154
  store i64 %155, ptr %PC, align 8
  %160 = add i64 %155, 4
  %161 = load i64, ptr %RBP, align 8
  %162 = sub i64 %161, 8
  %163 = call i64 @__remill_read_memory_64(ptr noundef %158, i64 noundef %162) #3
  store i64 %163, ptr %RAX, align 8
  br label %164

164:                                              ; preds = %159
  store i64 %160, ptr %PC, align 8
  %165 = add i64 %160, 3
  %166 = load i64, ptr %RBP, align 8
  %167 = sub i64 %166, 36
  %168 = call i32 @__remill_read_memory_32(ptr noundef %158, i64 noundef %167) #3
  %169 = zext i32 %168 to i64
  store i64 %169, ptr %RDX, align 8
  br label %170

170:                                              ; preds = %164
  store i64 %165, ptr %PC, align 8
  %171 = add i64 %165, 3
  %172 = load i64, ptr %RAX, align 8
  %173 = add i64 %172, 8
  %174 = load i32, ptr %EDX, align 4
  %175 = zext i32 %174 to i64
  %176 = call ptr @__remill_write_memory_32(ptr noundef %158, i64 noundef %173, i32 noundef %174) #3
  br label %177

177:                                              ; preds = %170
  store i64 %171, ptr %PC, align 8
  %178 = add i64 %171, 4
  %179 = load i64, ptr %RBP, align 8
  %180 = sub i64 %179, 8
  %181 = call i64 @__remill_read_memory_64(ptr noundef %176, i64 noundef %180) #3
  store i64 %181, ptr %RAX, align 8
  br label %182

182:                                              ; preds = %177
  store i64 %178, ptr %PC, align 8
  %183 = add i64 %178, 4
  %184 = load i64, ptr %RBP, align 8
  %185 = sub i64 %184, 32
  %186 = load i64, ptr %RAX, align 8
  %187 = call ptr @__remill_write_memory_64(ptr noundef %176, i64 noundef %185, i64 noundef %186) #3
  br label %188

188:                                              ; preds = %182
  store i64 %183, ptr %PC, align 8
  %189 = add i64 %183, 4
  %190 = load i64, ptr %RBP, align 8
  %191 = sub i64 %190, 36
  %192 = load i64, ptr %RBP, align 8
  %193 = sub i64 %192, 36
  %194 = call i32 @__remill_read_memory_32(ptr noundef %187, i64 noundef %193) #3
  %195 = add i32 %194, 1
  %196 = call ptr @__remill_write_memory_32(ptr noundef %187, i64 noundef %191, i32 noundef %195) #3
  %197 = icmp ult i32 %195, %194
  %198 = icmp ult i32 %195, 1
  %199 = or i1 %197, %198
  %200 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext %199, i32 noundef %194, i32 noundef 1, i32 noundef %195) #3
  %201 = zext i1 %200 to i8
  %202 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %201, ptr %202, align 1
  %203 = trunc i32 %195 to i8
  %204 = call i8 @llvm.ctpop.i8(i8 %203)
  %205 = and i8 %204, 1
  %206 = xor i8 %205, 1
  %207 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %206, ptr %207, align 1
  %208 = xor i32 %195, %194
  %209 = xor i32 %208, 1
  %210 = trunc i32 %209 to i8
  %211 = lshr i8 %210, 4
  %212 = and i8 %211, 1
  %213 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 %212, ptr %213, align 1
  %214 = icmp eq i32 %195, 0
  %215 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %214, i32 noundef %194, i32 noundef 1, i32 noundef %195) #3
  %216 = zext i1 %215 to i8
  %217 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %216, ptr %217, align 1
  %218 = icmp slt i32 %195, 0
  %219 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %218, i32 noundef %194, i32 noundef 1, i32 noundef %195) #3
  %220 = zext i1 %219 to i8
  %221 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %220, ptr %221, align 1
  %222 = lshr i32 %208, 31
  %223 = xor i32 %195, 1
  %224 = lshr i32 %223, 31
  %225 = add nuw nsw i32 %222, %224
  %226 = icmp eq i32 %225, 2
  %227 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext %226, i32 noundef %194, i32 noundef 1, i32 noundef %195) #3
  %228 = zext i1 %227 to i8
  %229 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %228, ptr %229, align 1
  br label %66

230:                                              ; preds = %123
  store i64 %124, ptr %PC, align 8
  %231 = add i64 %124, 3
  %232 = load i64, ptr %RAX, align 8
  store i64 %232, ptr %RDI, align 8
  br label %233

233:                                              ; preds = %230
  store i64 %231, ptr %PC, align 8
  %234 = add i64 %231, 5
  %235 = add i64 %234, 107
  %236 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %237 = load i64, ptr %236, align 8
  %238 = add i64 %237, -8
  %239 = call ptr @__remill_write_memory_64(ptr noundef %MEMORY.0, i64 noundef %238, i64 noundef %234) #3
  store i64 %238, ptr %236, align 8
  %240 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %235, ptr %240, align 8
  %241 = load i64, ptr %PC, align 8
  %242 = call ptr @LIFTED.reverse(ptr %state, i64 %241, ptr %239)
  br label %243

243:                                              ; preds = %233
  store i64 %234, ptr %PC, align 8
  %244 = add i64 %234, 4
  %245 = load i64, ptr %RBP, align 8
  %246 = sub i64 %245, 24
  %247 = load i64, ptr %RAX, align 8
  %248 = call ptr @__remill_write_memory_64(ptr noundef %239, i64 noundef %246, i64 noundef %247) #3
  br label %249

249:                                              ; preds = %243
  store i64 %244, ptr %PC, align 8
  %250 = add i64 %244, 2
  %251 = add i64 %250, 87
  %252 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %251, ptr %252, align 8
  br label %253

253:                                              ; preds = %389, %249
  %MEMORY.1 = phi ptr [ %248, %249 ], [ %394, %389 ]
  %NEXT_PC.1 = phi i64 [ %251, %249 ], [ %390, %389 ]
  store i64 %NEXT_PC.1, ptr %PC, align 8
  %254 = add i64 %NEXT_PC.1, 5
  %255 = load i64, ptr %RBP, align 8
  %256 = sub i64 %255, 24
  %257 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.1, i64 noundef %256) #3
  %258 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext false, i64 noundef %257, i64 noundef 0, i64 noundef %257) #3
  %259 = zext i1 %258 to i8
  %260 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %259, ptr %260, align 1
  %261 = trunc i64 %257 to i8
  %262 = call i8 @llvm.ctpop.i8(i8 %261)
  %263 = and i8 %262, 1
  %264 = xor i8 %263, 1
  %265 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %264, ptr %265, align 1
  %266 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %266, align 1
  %267 = icmp eq i64 %257, 0
  %268 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %267, i64 noundef %257, i64 noundef 0, i64 noundef %257) #3
  %269 = zext i1 %268 to i8
  %270 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %269, ptr %270, align 1
  %271 = icmp slt i64 %257, 0
  %272 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %271, i64 noundef %257, i64 noundef 0, i64 noundef %257) #3
  %273 = zext i1 %272 to i8
  %274 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %273, ptr %274, align 1
  %275 = lshr i64 %257, 63
  %276 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext false, i64 noundef %257, i64 noundef 0, i64 noundef %257) #3
  %277 = zext i1 %276 to i8
  %278 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %277, ptr %278, align 1
  br label %279

279:                                              ; preds = %253
  store i64 %254, ptr %PC, align 8
  %280 = add i64 %254, 2
  %281 = sub i64 %280, 94
  %282 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %283 = load i8, ptr %282, align 1
  %284 = icmp eq i8 %283, 0
  %285 = call zeroext i1 @__remill_compare_neq(i1 noundef zeroext %284) #4
  %286 = zext i1 %285 to i8
  %287 = select i1 %285, i64 %281, i64 %280
  %288 = icmp eq i8 %286, 1
  br i1 %288, label %289, label %294

289:                                              ; preds = %279
  store i64 %287, ptr %PC, align 8
  %290 = add i64 %287, 4
  %291 = load i64, ptr %RBP, align 8
  %292 = sub i64 %291, 24
  %293 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.1, i64 noundef %292) #3
  store i64 %293, ptr %RAX, align 8
  br label %296

294:                                              ; preds = %279
  store i64 %287, ptr %PC, align 8
  %295 = add i64 %287, 5
  store i64 0, ptr %RAX, align 8
  br label %395

296:                                              ; preds = %289
  store i64 %290, ptr %PC, align 8
  %297 = add i64 %290, 3
  %298 = load i64, ptr %RAX, align 8
  store i64 %298, ptr %RSI, align 8
  br label %299

299:                                              ; preds = %296
  store i64 %297, ptr %PC, align 8
  %300 = add i64 %297, 7
  %301 = add i64 %300, 3593
  store i64 %301, ptr %RAX, align 8
  br label %302

302:                                              ; preds = %299
  store i64 %300, ptr %PC, align 8
  %303 = add i64 %300, 3
  %304 = load i64, ptr %RAX, align 8
  store i64 %304, ptr %RDI, align 8
  br label %305

305:                                              ; preds = %302
  store i64 %303, ptr %PC, align 8
  %306 = add i64 %303, 5
  store i64 0, ptr %RAX, align 8
  br label %307

307:                                              ; preds = %305
  store i64 %306, ptr %PC, align 8
  %308 = add i64 %306, 5
  %309 = sub i64 %308, 392
  %310 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %311 = load i64, ptr %310, align 8
  %312 = add i64 %311, -8
  %313 = call ptr @__remill_write_memory_64(ptr noundef %MEMORY.1, i64 noundef %312, i64 noundef %308) #3
  store i64 %312, ptr %310, align 8
  %314 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %309, ptr %314, align 8
  %315 = load i64, ptr %PC, align 8
  %316 = call ptr @EXTERNAL.printf(ptr %state, i64 %315, ptr %313)
  br label %317

317:                                              ; preds = %307
  store i64 %308, ptr %PC, align 8
  %318 = add i64 %308, 4
  %319 = load i64, ptr %RBP, align 8
  %320 = sub i64 %319, 24
  %321 = call i64 @__remill_read_memory_64(ptr noundef %313, i64 noundef %320) #3
  store i64 %321, ptr %RAX, align 8
  br label %322

322:                                              ; preds = %317
  store i64 %318, ptr %PC, align 8
  %323 = add i64 %318, 3
  %324 = load i64, ptr %RAX, align 8
  %325 = add i64 %324, 8
  %326 = call i32 @__remill_read_memory_32(ptr noundef %313, i64 noundef %325) #3
  %327 = zext i32 %326 to i64
  store i64 %327, ptr %RAX, align 8
  br label %328

328:                                              ; preds = %322
  store i64 %323, ptr %PC, align 8
  %329 = add i64 %323, 2
  %330 = load i32, ptr %EAX, align 4
  %331 = zext i32 %330 to i64
  %332 = and i64 %331, 4294967295
  store i64 %332, ptr %RSI, align 8
  br label %333

333:                                              ; preds = %328
  store i64 %329, ptr %PC, align 8
  %334 = add i64 %329, 7
  %335 = add i64 %334, 3564
  store i64 %335, ptr %RAX, align 8
  br label %336

336:                                              ; preds = %333
  store i64 %334, ptr %PC, align 8
  %337 = add i64 %334, 3
  %338 = load i64, ptr %RAX, align 8
  store i64 %338, ptr %RDI, align 8
  br label %339

339:                                              ; preds = %336
  store i64 %337, ptr %PC, align 8
  %340 = add i64 %337, 5
  store i64 0, ptr %RAX, align 8
  br label %341

341:                                              ; preds = %339
  store i64 %340, ptr %PC, align 8
  %342 = add i64 %340, 5
  %343 = sub i64 %342, 421
  %344 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %345 = load i64, ptr %344, align 8
  %346 = add i64 %345, -8
  %347 = call ptr @__remill_write_memory_64(ptr noundef %313, i64 noundef %346, i64 noundef %342) #3
  store i64 %346, ptr %344, align 8
  %348 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %343, ptr %348, align 8
  %349 = load i64, ptr %PC, align 8
  %350 = call ptr @EXTERNAL.printf(ptr %state, i64 %349, ptr %347)
  br label %351

351:                                              ; preds = %341
  store i64 %342, ptr %PC, align 8
  %352 = add i64 %342, 4
  %353 = load i64, ptr %RBP, align 8
  %354 = sub i64 %353, 24
  %355 = call i64 @__remill_read_memory_64(ptr noundef %347, i64 noundef %354) #3
  store i64 %355, ptr %RAX, align 8
  br label %356

356:                                              ; preds = %351
  store i64 %352, ptr %PC, align 8
  %357 = add i64 %352, 3
  %358 = load i64, ptr %RAX, align 8
  %359 = call i64 @__remill_read_memory_64(ptr noundef %347, i64 noundef %358) #3
  store i64 %359, ptr %RAX, align 8
  br label %360

360:                                              ; preds = %356
  store i64 %357, ptr %PC, align 8
  %361 = add i64 %357, 4
  %362 = load i64, ptr %RBP, align 8
  %363 = sub i64 %362, 16
  %364 = load i64, ptr %RAX, align 8
  %365 = call ptr @__remill_write_memory_64(ptr noundef %347, i64 noundef %363, i64 noundef %364) #3
  br label %366

366:                                              ; preds = %360
  store i64 %361, ptr %PC, align 8
  %367 = add i64 %361, 4
  %368 = load i64, ptr %RBP, align 8
  %369 = sub i64 %368, 24
  %370 = call i64 @__remill_read_memory_64(ptr noundef %365, i64 noundef %369) #3
  store i64 %370, ptr %RAX, align 8
  br label %371

371:                                              ; preds = %366
  store i64 %367, ptr %PC, align 8
  %372 = add i64 %367, 3
  %373 = load i64, ptr %RAX, align 8
  store i64 %373, ptr %RDI, align 8
  br label %374

374:                                              ; preds = %371
  store i64 %372, ptr %PC, align 8
  %375 = add i64 %372, 5
  %376 = sub i64 %375, 460
  %377 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %378 = load i64, ptr %377, align 8
  %379 = add i64 %378, -8
  %380 = call ptr @__remill_write_memory_64(ptr noundef %365, i64 noundef %379, i64 noundef %375) #3
  store i64 %379, ptr %377, align 8
  %381 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %376, ptr %381, align 8
  %382 = load i64, ptr %PC, align 8
  %383 = call ptr @EXTERNAL.free(ptr %state, i64 %382, ptr %380)
  br label %384

384:                                              ; preds = %374
  store i64 %375, ptr %PC, align 8
  %385 = add i64 %375, 4
  %386 = load i64, ptr %RBP, align 8
  %387 = sub i64 %386, 16
  %388 = call i64 @__remill_read_memory_64(ptr noundef %380, i64 noundef %387) #3
  store i64 %388, ptr %RAX, align 8
  br label %389

389:                                              ; preds = %384
  store i64 %385, ptr %PC, align 8
  %390 = add i64 %385, 4
  %391 = load i64, ptr %RBP, align 8
  %392 = sub i64 %391, 24
  %393 = load i64, ptr %RAX, align 8
  %394 = call ptr @__remill_write_memory_64(ptr noundef %380, i64 noundef %392, i64 noundef %393) #3
  br label %253

395:                                              ; preds = %294
  store i64 %295, ptr %PC, align 8
  %396 = add i64 %295, 1
  %397 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 15
  %398 = load i64, ptr %397, align 8
  %399 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.1, i64 noundef %398) #3
  store i64 %399, ptr %397, align 8
  %400 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %401 = add i64 %398, 8
  store i64 %401, ptr %400, align 8
  br label %402

402:                                              ; preds = %395
  store i64 %396, ptr %PC, align 8
  %403 = add i64 %396, 1
  %404 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %405 = load i64, ptr %404, align 8
  %406 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.1, i64 noundef %405) #3
  %407 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %406, ptr %407, align 8
  %408 = load i64, ptr %404, align 8
  %409 = add i64 %408, 8
  store i64 %409, ptr %404, align 8
  store i64 %406, ptr %PC, align 8
  %410 = load i64, ptr %PC, align 8
  %411 = tail call ptr @__remill_function_return(ptr %state, i64 %410, ptr %MEMORY.1)
  ret ptr %411
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
declare ptr @__remill_write_memory_32(ptr noundef, i64 noundef, i32 noundef) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare i32 @__remill_read_memory_32(ptr noundef, i64 noundef) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_compare_sle(i1 noundef zeroext) #0

; Function Attrs: noduplicate noinline nounwind optnone
declare i64 @__remill_read_memory_64(ptr noundef, i64 noundef) #0

declare ptr @EXTERNAL.malloc(ptr, i64, ptr)

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i1 @__remill_compare_neq(i1 noundef zeroext) #0

declare ptr @EXTERNAL.printf(ptr, i64, ptr)

declare ptr @EXTERNAL.free(ptr, i64, ptr)

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
  %PC = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 33, i32 0, i32 0
  br label %1

1:                                                ; preds = %0
  store i64 %program_counter, ptr %PC, align 8
  %2 = add i64 %program_counter, 4
  %3 = load i32, ptr %EDX, align 4
  %4 = zext i32 %3 to i64
  %5 = load i32, ptr %EDI, align 4
  %6 = zext i32 %5 to i64
  br label %7

7:                                                ; preds = %1
  store i64 %2, ptr %PC, align 8
  %8 = add i64 %2, 2
  %9 = load i64, ptr %RBP, align 8
  %10 = load i32, ptr %EBP, align 4
  %11 = zext i32 %10 to i64
  %12 = trunc i64 %9 to i32
  %13 = xor i32 %10, %12
  %14 = zext i32 %13 to i64
  store i64 %14, ptr %RBP, align 8
  %15 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %15, align 1
  %16 = trunc i32 %13 to i8
  %17 = call i8 @llvm.ctpop.i8(i8 %16)
  %18 = and i8 %17, 1
  %19 = xor i8 %18, 1
  %20 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %19, ptr %20, align 1
  %21 = icmp eq i32 %13, 0
  %22 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %21, i32 noundef %12, i32 noundef %10, i32 noundef %13) #3
  %23 = zext i1 %22 to i8
  %24 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %23, ptr %24, align 1
  %25 = icmp slt i32 %13, 0
  %26 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %25, i32 noundef %12, i32 noundef %10, i32 noundef %13) #3
  %27 = zext i1 %26 to i8
  %28 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %27, ptr %28, align 1
  %29 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %29, align 1
  %30 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %30, align 1
  %31 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %31, ptr %30, align 1
  br label %32

32:                                               ; preds = %7
  store i64 %8, ptr %PC, align 8
  %33 = add i64 %8, 3
  %34 = load i64, ptr %RDX, align 8
  store i64 %34, ptr %R9, align 8
  br label %35

35:                                               ; preds = %32
  store i64 %33, ptr %PC, align 8
  %36 = add i64 %33, 1
  %37 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %38 = load i64, ptr %37, align 8
  %39 = add i64 %38, 8
  store i64 %39, ptr %37, align 8
  %40 = call i64 @__remill_read_memory_64(ptr noundef %memory, i64 noundef %38) #3
  store i64 %40, ptr %RSI, align 8
  br label %41

41:                                               ; preds = %35
  store i64 %36, ptr %PC, align 8
  %42 = add i64 %36, 3
  %43 = load i64, ptr %RSP, align 8
  store i64 %43, ptr %RDX, align 8
  br label %44

44:                                               ; preds = %41
  store i64 %42, ptr %PC, align 8
  %45 = add i64 %42, 4
  %46 = load i64, ptr %RSP, align 8
  %47 = and i64 -16, %46
  store i64 %47, ptr %RSP, align 8
  %48 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %48, align 1
  %49 = trunc i64 %47 to i8
  %50 = call i8 @llvm.ctpop.i8(i8 %49)
  %51 = and i8 %50, 1
  %52 = xor i8 %51, 1
  %53 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %52, ptr %53, align 1
  %54 = icmp eq i64 %47, 0
  %55 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %54, i64 noundef %46, i64 noundef -16, i64 noundef %47) #3
  %56 = zext i1 %55 to i8
  %57 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %56, ptr %57, align 1
  %58 = icmp slt i64 %47, 0
  %59 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %58, i64 noundef %46, i64 noundef -16, i64 noundef %47) #3
  %60 = zext i1 %59 to i8
  %61 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %60, ptr %61, align 1
  %62 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %62, align 1
  %63 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %63, align 1
  br label %64

64:                                               ; preds = %44
  store i64 %45, ptr %PC, align 8
  %65 = add i64 %45, 1
  %66 = load i64, ptr %RAX, align 8
  %67 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %68 = load i64, ptr %67, align 8
  %69 = add i64 %68, -8
  %70 = call ptr @__remill_write_memory_64(ptr noundef %memory, i64 noundef %69, i64 noundef %66) #3
  store i64 %69, ptr %67, align 8
  br label %71

71:                                               ; preds = %64
  store i64 %65, ptr %PC, align 8
  %72 = add i64 %65, 1
  %73 = load i64, ptr %RSP, align 8
  %74 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %75 = load i64, ptr %74, align 8
  %76 = add i64 %75, -8
  %77 = call ptr @__remill_write_memory_64(ptr noundef %70, i64 noundef %76, i64 noundef %73) #3
  store i64 %76, ptr %74, align 8
  br label %78

78:                                               ; preds = %71
  store i64 %72, ptr %PC, align 8
  %79 = add i64 %72, 3
  %80 = load i64, ptr %R8, align 8
  %81 = load i32, ptr %R8D, align 4
  %82 = zext i32 %81 to i64
  %83 = trunc i64 %80 to i32
  %84 = xor i32 %81, %83
  %85 = zext i32 %84 to i64
  store i64 %85, ptr %R8, align 8
  %86 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %86, align 1
  %87 = trunc i32 %84 to i8
  %88 = call i8 @llvm.ctpop.i8(i8 %87)
  %89 = and i8 %88, 1
  %90 = xor i8 %89, 1
  %91 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %90, ptr %91, align 1
  %92 = icmp eq i32 %84, 0
  %93 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %92, i32 noundef %83, i32 noundef %81, i32 noundef %84) #3
  %94 = zext i1 %93 to i8
  %95 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %94, ptr %95, align 1
  %96 = icmp slt i32 %84, 0
  %97 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %96, i32 noundef %83, i32 noundef %81, i32 noundef %84) #3
  %98 = zext i1 %97 to i8
  %99 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %98, ptr %99, align 1
  %100 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %100, align 1
  %101 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %101, align 1
  %102 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %102, ptr %101, align 1
  br label %103

103:                                              ; preds = %78
  store i64 %79, ptr %PC, align 8
  %104 = add i64 %79, 2
  %105 = load i64, ptr %RCX, align 8
  %106 = load i32, ptr %ECX, align 4
  %107 = zext i32 %106 to i64
  %108 = trunc i64 %105 to i32
  %109 = xor i32 %106, %108
  %110 = zext i32 %109 to i64
  store i64 %110, ptr %RCX, align 8
  %111 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 0, ptr %111, align 1
  %112 = trunc i32 %109 to i8
  %113 = call i8 @llvm.ctpop.i8(i8 %112)
  %114 = and i8 %113, 1
  %115 = xor i8 %114, 1
  %116 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %115, ptr %116, align 1
  %117 = icmp eq i32 %109, 0
  %118 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %117, i32 noundef %108, i32 noundef %106, i32 noundef %109) #3
  %119 = zext i1 %118 to i8
  %120 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %119, ptr %120, align 1
  %121 = icmp slt i32 %109, 0
  %122 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %121, i32 noundef %108, i32 noundef %106, i32 noundef %109) #3
  %123 = zext i1 %122 to i8
  %124 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %123, ptr %124, align 1
  %125 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 0, ptr %125, align 1
  %126 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %126, align 1
  %127 = call zeroext i8 @__remill_undefined_8() #4
  store i8 %127, ptr %126, align 1
  br label %128

128:                                              ; preds = %103
  store i64 %104, ptr %PC, align 8
  %129 = add i64 %104, 7
  %130 = add i64 %129, 202
  store i64 %130, ptr %RDI, align 8
  br label %131

131:                                              ; preds = %128
  store i64 %129, ptr %PC, align 8
  %132 = add i64 %129, 6
  %133 = add i64 %132, 12051
  %134 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %135 = load i64, ptr %134, align 8
  %136 = add i64 %135, -8
  %137 = call i64 @__remill_read_memory_64(ptr noundef %77, i64 noundef %133) #3
  %138 = call ptr @__remill_write_memory_64(ptr noundef %77, i64 noundef %136, i64 noundef %132) #3
  store i64 %136, ptr %134, align 8
  %139 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %137, ptr %139, align 8
  %140 = load i64, ptr %PC, align 8
  %141 = call ptr @__remill_function_call(ptr %state, i64 %140, ptr %138)
  br label %142

142:                                              ; preds = %131
  br label %143

143:                                              ; preds = %142
  store i64 %132, ptr %PC, align 8
  %144 = add i64 %132, 1
  store i64 %144, ptr %PC, align 8
  %145 = load i64, ptr %PC, align 8
  %146 = tail call ptr @__remill_error(ptr %state, i64 %145, ptr %138)
  ret ptr %146
}

; Function Attrs: noduplicate noinline nounwind optnone
declare zeroext i8 @__remill_undefined_8() #0

; Function Attrs: noduplicate noinline nounwind optnone
declare ptr @__remill_function_call(ptr noundef nonnull align 1, i64 noundef, ptr noundef) #2

; Function Attrs: noduplicate noinline nounwind optnone
declare ptr @__remill_error(ptr noundef nonnull align 16 dereferenceable(3504), i64 noundef, ptr noundef) #0

define ptr @LIFTED.reverse(ptr noalias %state, i64 %program_counter, ptr noalias %memory) {
  %RDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
  %RAX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 1, i32 0, i32 0
  %RDI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 11, i32 0, i32 0
  %RSP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 13, i32 0, i32 0
  %RBP = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 15, i32 0, i32 0
  %EDI = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 11, i32 0, i32 0
  %EDX = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 7, i32 0, i32 0
  %PC = getelementptr inbounds %struct.State, ptr %state, i32 0, i32 0, i32 6, i32 33, i32 0, i32 0
  br label %1

1:                                                ; preds = %0
  store i64 %program_counter, ptr %PC, align 8
  %2 = add i64 %program_counter, 4
  %3 = load i32, ptr %EDX, align 4
  %4 = zext i32 %3 to i64
  %5 = load i32, ptr %EDI, align 4
  %6 = zext i32 %5 to i64
  br label %7

7:                                                ; preds = %1
  store i64 %2, ptr %PC, align 8
  %8 = add i64 %2, 1
  %9 = load i64, ptr %RBP, align 8
  %10 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %11 = load i64, ptr %10, align 8
  %12 = add i64 %11, -8
  %13 = call ptr @__remill_write_memory_64(ptr noundef %memory, i64 noundef %12, i64 noundef %9) #3
  store i64 %12, ptr %10, align 8
  br label %14

14:                                               ; preds = %7
  store i64 %8, ptr %PC, align 8
  %15 = add i64 %8, 3
  %16 = load i64, ptr %RSP, align 8
  store i64 %16, ptr %RBP, align 8
  br label %17

17:                                               ; preds = %14
  store i64 %15, ptr %PC, align 8
  %18 = add i64 %15, 4
  %19 = load i64, ptr %RBP, align 8
  %20 = sub i64 %19, 24
  %21 = load i64, ptr %RDI, align 8
  %22 = call ptr @__remill_write_memory_64(ptr noundef %13, i64 noundef %20, i64 noundef %21) #3
  br label %23

23:                                               ; preds = %17
  store i64 %18, ptr %PC, align 8
  %24 = add i64 %18, 8
  %25 = load i64, ptr %RBP, align 8
  %26 = sub i64 %25, 16
  %27 = call ptr @__remill_write_memory_64(ptr noundef %22, i64 noundef %26, i64 noundef 0) #3
  br label %28

28:                                               ; preds = %23
  store i64 %24, ptr %PC, align 8
  %29 = add i64 %24, 5
  %30 = load i64, ptr %RBP, align 8
  %31 = sub i64 %30, 24
  %32 = call i64 @__remill_read_memory_64(ptr noundef %27, i64 noundef %31) #3
  %33 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext false, i64 noundef %32, i64 noundef 0, i64 noundef %32) #3
  %34 = zext i1 %33 to i8
  %35 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %34, ptr %35, align 1
  %36 = trunc i64 %32 to i8
  %37 = call i8 @llvm.ctpop.i8(i8 %36)
  %38 = and i8 %37, 1
  %39 = xor i8 %38, 1
  %40 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %39, ptr %40, align 1
  %41 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %41, align 1
  %42 = icmp eq i64 %32, 0
  %43 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %42, i64 noundef %32, i64 noundef 0, i64 noundef %32) #3
  %44 = zext i1 %43 to i8
  %45 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %44, ptr %45, align 1
  %46 = icmp slt i64 %32, 0
  %47 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %46, i64 noundef %32, i64 noundef 0, i64 noundef %32) #3
  %48 = zext i1 %47 to i8
  %49 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %48, ptr %49, align 1
  %50 = lshr i64 %32, 63
  %51 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext false, i64 noundef %32, i64 noundef 0, i64 noundef %32) #3
  %52 = zext i1 %51 to i8
  %53 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %52, ptr %53, align 1
  br label %54

54:                                               ; preds = %28
  store i64 %29, ptr %PC, align 8
  %55 = add i64 %29, 2
  %56 = add i64 %55, 44
  %57 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %58 = load i8, ptr %57, align 1
  %59 = icmp eq i8 %58, 0
  %60 = call zeroext i1 @__remill_compare_neq(i1 noundef zeroext %59) #4
  %61 = zext i1 %60 to i8
  %62 = select i1 %60, i64 %56, i64 %55
  %63 = icmp eq i8 %61, 1
  br i1 %63, label %64, label %90

64:                                               ; preds = %166, %54
  %MEMORY.0 = phi ptr [ %27, %54 ], [ %171, %166 ]
  %NEXT_PC.0 = phi i64 [ %62, %54 ], [ %167, %166 ]
  store i64 %NEXT_PC.0, ptr %PC, align 8
  %65 = add i64 %NEXT_PC.0, 5
  %66 = load i64, ptr %RBP, align 8
  %67 = sub i64 %66, 24
  %68 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.0, i64 noundef %67) #3
  %69 = call zeroext i1 (i1, ...) @__remill_flag_computation_carry(i1 noundef zeroext false, i64 noundef %68, i64 noundef 0, i64 noundef %68) #3
  %70 = zext i1 %69 to i8
  %71 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 1
  store i8 %70, ptr %71, align 1
  %72 = trunc i64 %68 to i8
  %73 = call i8 @llvm.ctpop.i8(i8 %72)
  %74 = and i8 %73, 1
  %75 = xor i8 %74, 1
  %76 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 3
  store i8 %75, ptr %76, align 1
  %77 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 5
  store i8 0, ptr %77, align 1
  %78 = icmp eq i64 %68, 0
  %79 = call zeroext i1 (i1, ...) @__remill_flag_computation_zero(i1 noundef zeroext %78, i64 noundef %68, i64 noundef 0, i64 noundef %68) #3
  %80 = zext i1 %79 to i8
  %81 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  store i8 %80, ptr %81, align 1
  %82 = icmp slt i64 %68, 0
  %83 = call zeroext i1 (i1, ...) @__remill_flag_computation_sign(i1 noundef zeroext %82, i64 noundef %68, i64 noundef 0, i64 noundef %68) #3
  %84 = zext i1 %83 to i8
  %85 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 9
  store i8 %84, ptr %85, align 1
  %86 = lshr i64 %68, 63
  %87 = call zeroext i1 (i1, ...) @__remill_flag_computation_overflow(i1 noundef zeroext false, i64 noundef %68, i64 noundef 0, i64 noundef %68) #3
  %88 = zext i1 %87 to i8
  %89 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 13
  store i8 %88, ptr %89, align 1
  br label %105

90:                                               ; preds = %54
  store i64 %62, ptr %PC, align 8
  %91 = add i64 %62, 4
  %92 = load i64, ptr %RBP, align 8
  %93 = sub i64 %92, 24
  %94 = call i64 @__remill_read_memory_64(ptr noundef %27, i64 noundef %93) #3
  store i64 %94, ptr %RAX, align 8
  br label %95

95:                                               ; preds = %90
  store i64 %91, ptr %PC, align 8
  %96 = add i64 %91, 2
  %97 = add i64 %96, 49
  %98 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %97, ptr %98, align 8
  br label %99

99:                                               ; preds = %120, %95
  %MEMORY.1 = phi ptr [ %MEMORY.0, %120 ], [ %27, %95 ]
  %NEXT_PC.1 = phi i64 [ %121, %120 ], [ %97, %95 ]
  store i64 %NEXT_PC.1, ptr %PC, align 8
  %100 = add i64 %NEXT_PC.1, 1
  %101 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %102 = load i64, ptr %101, align 8
  %103 = add i64 %102, 8
  store i64 %103, ptr %101, align 8
  %104 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.1, i64 noundef %102) #3
  store i64 %104, ptr %RBP, align 8
  br label %172

105:                                              ; preds = %64
  store i64 %65, ptr %PC, align 8
  %106 = add i64 %65, 2
  %107 = sub i64 %106, 45
  %108 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 2, i32 7
  %109 = load i8, ptr %108, align 1
  %110 = icmp eq i8 %109, 0
  %111 = call zeroext i1 @__remill_compare_neq(i1 noundef zeroext %110) #4
  %112 = zext i1 %111 to i8
  %113 = select i1 %111, i64 %107, i64 %106
  %114 = icmp eq i8 %112, 1
  br i1 %114, label %115, label %120

115:                                              ; preds = %105
  store i64 %113, ptr %PC, align 8
  %116 = add i64 %113, 4
  %117 = load i64, ptr %RBP, align 8
  %118 = sub i64 %117, 24
  %119 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.0, i64 noundef %118) #3
  store i64 %119, ptr %RAX, align 8
  br label %125

120:                                              ; preds = %105
  store i64 %113, ptr %PC, align 8
  %121 = add i64 %113, 4
  %122 = load i64, ptr %RBP, align 8
  %123 = sub i64 %122, 16
  %124 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.0, i64 noundef %123) #3
  store i64 %124, ptr %RAX, align 8
  br label %99

125:                                              ; preds = %115
  store i64 %116, ptr %PC, align 8
  %126 = add i64 %116, 3
  %127 = load i64, ptr %RAX, align 8
  %128 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.0, i64 noundef %127) #3
  store i64 %128, ptr %RAX, align 8
  br label %129

129:                                              ; preds = %125
  store i64 %126, ptr %PC, align 8
  %130 = add i64 %126, 4
  %131 = load i64, ptr %RBP, align 8
  %132 = sub i64 %131, 8
  %133 = load i64, ptr %RAX, align 8
  %134 = call ptr @__remill_write_memory_64(ptr noundef %MEMORY.0, i64 noundef %132, i64 noundef %133) #3
  br label %135

135:                                              ; preds = %129
  store i64 %130, ptr %PC, align 8
  %136 = add i64 %130, 4
  %137 = load i64, ptr %RBP, align 8
  %138 = sub i64 %137, 24
  %139 = call i64 @__remill_read_memory_64(ptr noundef %134, i64 noundef %138) #3
  store i64 %139, ptr %RAX, align 8
  br label %140

140:                                              ; preds = %135
  store i64 %136, ptr %PC, align 8
  %141 = add i64 %136, 4
  %142 = load i64, ptr %RBP, align 8
  %143 = sub i64 %142, 16
  %144 = call i64 @__remill_read_memory_64(ptr noundef %134, i64 noundef %143) #3
  store i64 %144, ptr %RDX, align 8
  br label %145

145:                                              ; preds = %140
  store i64 %141, ptr %PC, align 8
  %146 = add i64 %141, 3
  %147 = load i64, ptr %RAX, align 8
  %148 = load i64, ptr %RDX, align 8
  %149 = call ptr @__remill_write_memory_64(ptr noundef %134, i64 noundef %147, i64 noundef %148) #3
  br label %150

150:                                              ; preds = %145
  store i64 %146, ptr %PC, align 8
  %151 = add i64 %146, 4
  %152 = load i64, ptr %RBP, align 8
  %153 = sub i64 %152, 24
  %154 = call i64 @__remill_read_memory_64(ptr noundef %149, i64 noundef %153) #3
  store i64 %154, ptr %RAX, align 8
  br label %155

155:                                              ; preds = %150
  store i64 %151, ptr %PC, align 8
  %156 = add i64 %151, 4
  %157 = load i64, ptr %RBP, align 8
  %158 = sub i64 %157, 16
  %159 = load i64, ptr %RAX, align 8
  %160 = call ptr @__remill_write_memory_64(ptr noundef %149, i64 noundef %158, i64 noundef %159) #3
  br label %161

161:                                              ; preds = %155
  store i64 %156, ptr %PC, align 8
  %162 = add i64 %156, 4
  %163 = load i64, ptr %RBP, align 8
  %164 = sub i64 %163, 8
  %165 = call i64 @__remill_read_memory_64(ptr noundef %160, i64 noundef %164) #3
  store i64 %165, ptr %RAX, align 8
  br label %166

166:                                              ; preds = %161
  store i64 %162, ptr %PC, align 8
  %167 = add i64 %162, 4
  %168 = load i64, ptr %RBP, align 8
  %169 = sub i64 %168, 24
  %170 = load i64, ptr %RAX, align 8
  %171 = call ptr @__remill_write_memory_64(ptr noundef %160, i64 noundef %169, i64 noundef %170) #3
  br label %64

172:                                              ; preds = %99
  store i64 %100, ptr %PC, align 8
  %173 = add i64 %100, 1
  %174 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 13
  %175 = load i64, ptr %174, align 8
  %176 = call i64 @__remill_read_memory_64(ptr noundef %MEMORY.1, i64 noundef %175) #3
  %177 = getelementptr inbounds %struct.X86State, ptr %state, i64 0, i32 6, i32 33
  store i64 %176, ptr %177, align 8
  %178 = load i64, ptr %174, align 8
  %179 = add i64 %178, 8
  store i64 %179, ptr %174, align 8
  store i64 %176, ptr %PC, align 8
  %180 = load i64, ptr %PC, align 8
  %181 = tail call ptr @__remill_function_return(ptr %state, i64 %180, ptr %MEMORY.1)
  ret ptr %181
}

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
