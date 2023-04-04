import '../translation.dart';
import 'authentication_pt_br.dart';
import 'cart_pt_br.dart';
import 'commons_pt_br.dart';
import 'discovery_pt_br.dart';
import 'learning_pt_br.dart';
import 'profile_pt_br.dart';

class PtBR
    with
        AuthenticationPtBR,
        CartPtBR,
        CommonsPtBR,
        DiscoveryPtBR,
        LearningPtBR,
        ProfilePtBR
    implements Translation {}
