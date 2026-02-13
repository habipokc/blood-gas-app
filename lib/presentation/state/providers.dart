import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/datasources/local/database.dart';
import '../../data/datasources/local/ocr_service.dart';
import '../../data/repositories/blood_gas_repository_impl.dart';
import '../../data/repositories/patient_repository_impl.dart';
import '../../domain/repositories/i_blood_gas_repository.dart';
import '../../domain/repositories/i_patient_repository.dart';
import '../../core/utils/image_processor.dart';
import '../../core/utils/text_parser.dart';

part 'providers.g.dart';

// --- Core ---
@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase();
}

@Riverpod(keepAlive: true)
ImageProcessor imageProcessor(ImageProcessorRef ref) {
  return ImageProcessor();
}

@Riverpod(keepAlive: true)
TextParser textParser(TextParserRef ref) {
  return TextParser();
}

// --- Data Sources ---
@Riverpod(keepAlive: true)
OcrService ocrService(OcrServiceRef ref) {
  return OcrService(ref.watch(imageProcessorProvider), ref.watch(textParserProvider));
}

// --- Repositories ---
@Riverpod(keepAlive: true)
IPatientRepository patientRepository(PatientRepositoryRef ref) {
  return PatientRepositoryImpl(ref.watch(appDatabaseProvider));
}

@Riverpod(keepAlive: true)
IBloodGasRepository bloodGasRepository(BloodGasRepositoryRef ref) {
  return BloodGasRepositoryImpl(ref.watch(appDatabaseProvider));
}
