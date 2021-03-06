#!/bin/sh
case "$1" in
	'-c')
		make
		;;
	'-s')
		case "$2" in
			'-j')
				java -cp ".:lib/json-simple-1.1.1.jar:bin" GenerateJSON $3
				;;
			'-p')
				java -cp ".:lib/protobuf.jar:bin" GenerateProtobuf $3
				;;
		esac
		;;
	'-d')
		case "$2" in
			'-j')
				java  -cp ".:lib/json-simple-1.1.1.jar:bin" DeserializeJSON $3
				;;
			'-p')
				java  -cp ".:lib/protobuf.jar:bin" DeserializeProtobuf $3
				;;
		esac
		;;
	'-t')
		case "$2" in
			'-j')
				java -XX:-UseGCOverheadLimit -cp ".:lib/json-simple-1.1.1.jar:bin" GenerateJSON $3 STAT
				java  -XX:-UseGCOverheadLimit -cp ".:lib/json-simple-1.1.1.jar:bin" DeserializeJSON sampleresult.json STAT
				;;
			'-p')
				java -cp ".:lib/protobuf.jar:bin" GenerateProtobuf $3 STAT
				java  -cp ".:lib/protobuf.jar:bin" DeserializeProtobuf result_protobuf STAT
				;;
		esac
		;;
esac
