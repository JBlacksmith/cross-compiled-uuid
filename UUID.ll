; ModuleID = 'UUID.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.computer = type { %struct._IO_FILE* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [10 x i8] c"cpuid.txt\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"sed -n 6p cpuid.txt\00", align 1
@buffer = common global [20000 x i8] zeroinitializer, align 16
@.str.3 = private unnamed_addr constant [5 x i8] c"\0A%s\0A\00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"lsblk -o UUID\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"\0A%s\0A\0A\00", align 1
@computer = common global %struct.computer zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %newComputer = alloca %struct.computer, align 8
  %computerFile = alloca %struct._IO_FILE*, align 8
  %UUIDLine = alloca %struct._IO_FILE*, align 8
  %output = alloca %struct._IO_FILE*, align 8
  %out = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %1, align 4
  %2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %2, %struct._IO_FILE** %computerFile, align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** %computerFile, align 8
  %4 = icmp ne %struct._IO_FILE* %3, null
  br i1 %4, label %5, label %16

; <label>:5                                       ; preds = %0
  %6 = call %struct._IO_FILE* @popen(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %6, %struct._IO_FILE** %UUIDLine, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %UUIDLine, align 8
  %8 = call i64 @fread(i8* getelementptr inbounds ([20000 x i8], [20000 x i8]* @buffer, i32 0, i32 0), i64 100, i64 1, %struct._IO_FILE* %7)
  %9 = getelementptr inbounds %struct.computer, %struct.computer* %newComputer, i32 0, i32 0
  store %struct._IO_FILE* bitcast ([20000 x i8]* @buffer to %struct._IO_FILE*), %struct._IO_FILE** %9, align 8
  %10 = getelementptr inbounds %struct.computer, %struct.computer* %newComputer, i32 0, i32 0
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8
  %12 = bitcast %struct._IO_FILE* %11 to i8*
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i8* %12)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %computerFile, align 8
  %15 = call i32 @fclose(%struct._IO_FILE* %14)
  br label %16

; <label>:16                                      ; preds = %5, %0
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** %computerFile, align 8
  %18 = icmp ne %struct._IO_FILE* %17, null
  br i1 %18, label %30, label %19

; <label>:19                                      ; preds = %16
  %20 = call %struct._IO_FILE* @popen(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %20, %struct._IO_FILE** %output, align 8
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %output, align 8
  %22 = call i64 @fread(i8* getelementptr inbounds ([20000 x i8], [20000 x i8]* @buffer, i32 0, i32 0), i64 100, i64 5, %struct._IO_FILE* %21)
  %23 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0))
  store %struct._IO_FILE* %23, %struct._IO_FILE** %out, align 8
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([20000 x i8], [20000 x i8]* @buffer, i32 0, i32 0))
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %out, align 8
  %27 = call i32 @fclose(%struct._IO_FILE* %26)
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** %output, align 8
  %29 = call i32 @pclose(%struct._IO_FILE* %28)
  br label %30

; <label>:30                                      ; preds = %19, %16
  ret i32 0
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare %struct._IO_FILE* @popen(i8*, i8*) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare i32 @printf(i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @pclose(%struct._IO_FILE*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
