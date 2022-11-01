import sys
import random
import time
import importlib
from pairing_precomputation import t_1, t_2, t_3, t_4, t_5, t_6, t_7, t_8, t_9, t_10, lam, QAm, QBm;

# Setting

proof.all(False)
T1 = time.time();
p = 723052039002094107361003599788884005576894734840003495724069350408726241145246179836577530898248637260930177150883852537994636255107656785518307039015069087921789506381104115051503886754635408387340024583246537490366101326934038456222946101380816739719066426077256740580632591177285084547472721441639809131294336057262398843335816977589116146275108378694888969124194465383924297176410440908911707435428845604411117467867448599184713473801018935354483105030356707091538733862753904508698135902725200088311421597532025026042651232448303482615168545518015681806158865708401359674797889761472673282355253775553143542783921132578308099467730486338882698494876851244969382244711722052454733410935739

NA = 2257807090534892669619299020515821549176105730464758233106108940596789371615353683485779771190265962105250759304625577727943578886347583014974660208084121616658489731487707056128262301796023518056224829366813692532163701696241740668728728886497618318985545741027142187221236727720923207496485918730657782724338237779781827422272463639128325245689;

NB = 80061317243759437005975030286086565240538453941975149656410428667735016974699715944351147296649139573921413924458156172889413863837466019707907752407649057625003954793771907485301115216327351233227888827291749120330177754445381220963634691943990770431106544792207101485352458753280596764417213340076097689302682659800082501040307614466797143557415

string_A = (NA).str(base=2);

string_B = (NB).str(base=2);

prime = {3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809, 811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997, 1009, 1013, 1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069, 1087, 1091, 1093, 1097, 1103, 1109, 1117, 1123, 1129, 1151, 1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 1217, 1223, 1229, 1231, 1237, 1249, 1259, 1277, 1279, 1283, 1289, 1291, 1297, 1301, 1303, 1307, 1319, 1321, 1327, 1361, 1367, 1373, 1381, 1399, 1409, 1423, 1427, 1429, 1433, 1439, 1447, 1451, 1453, 1459, 1471, 1481, 1483, 1487, 1489, 1493, 1499, 1511, 1523, 1531, 1543, 1549, 1553, 1559, 1567, 1571, 1579, 1583, 1597, 1601, 1607, 1609, 1613, 1619, 1669};

prime_A = { 3, 7, 13, 19, 29, 37, 43, 53, 61, 71, 79, 89, 101, 107, 113, 131, 139, 151,163, 173, 181, 193, 199, 223, 229, 239, 251, 263, 271, 281, 293, 311, 317, 337,349, 359, 373, 383, 397, 409, 421, 433, 443, 457, 463, 479, 491, 503, 521, 541,557, 569, 577, 593, 601, 613, 619, 641, 647, 659, 673, 683, 701, 719, 733, 743,757, 769, 787, 809, 821, 827, 839, 857, 863, 881, 887, 911, 929, 941, 953, 971,983, 997, 1013, 1021, 1033, 1049, 1061, 1069, 1091, 1097, 1109, 1123, 1151,1163, 1181,1193, 1213, 1223, 1231, 1249, 1277, 1283, 1291, 1301, 1307, 1321,1361, 1373, 1399, 1423, 1429, 1439, 1451, 1459,1481, 1487, 1493, 1511, 1531,1549, 1559, 1571, 1583, 1601, 1609, 1619};

string_NA = (NA).str(base=4);

Len4_NA = len(string_NA) - 1;  

string_NB = (NB).str(base=4);

Len4_NB = len(string_NB) - 1;  


prime_B = prime - prime_A;

prime_A = list(prime_A);

prime_A.sort();

prime_A.reverse();

prime_B = list(prime_B);

prime_B.sort();

prime_B.reverse();


G.<a>=GF(p^2,name='a',modulus=x^2+1);

GX.<X> = G[];

E0 = EllipticCurve(G,[1,0]);

PA=E0([619166089577766014762074252132695447485279237895424361601037191223958259060492145632739182561775604116348560754831479833392758436550672341373656041775368711305721452273271007335134049864401158211833449600843542977438734298487532299353723415692774087056397938895650209260494699992757003138329114063200473426971873181984421416277848982989871094486003547249194874637780489830492948643402441497845755553325590605828949510880766649994357981028635819809010439149142342554086208155979706990631580941995415550518113382313867304459484944041143112875148275154129209033114547885163038221915552058755309829920899827928975673087857930469739143401025796952831235183502109264770811266168885420830534352621779, 257744422927446718448137577991121726863929448000813929465505256236270441032363626226556926863904322621027808869061914827143174103546647891201345222191952650613504720141479209256799053625692613205910972287863887111558599774117090960058817158819710165473539195169745570949600199282234814217333545817192389485433178602891173332969158091489461114050578983179785040258917559789443762158763776149258800689590177415728290790001680724568091950094720614730082397452481496242861380875658776165888821351140426263731736196704166809216223475252325160816667350877292012812729491529432392047012693416295519878517596979970407790888347837689526842067769775266720562607288325480774645179221355535685486617737216]);

PB=E0([554830661168078541095230087874301789754321987083143652518854719223967745573654086958528329163032665571782544200684274274507503875666423119123392940863076931961179103323093240586796435894939185819212193645326124298492525296285569233296203692039451119784843327598849527244708309639998032052368697517904120827142230868232949139289995914455297167970307011544552576211392451397334357158116237404548802152058681103085109496389652882971911072423929091304958985637896066636624507327900193131392918740593899360932664532711503689340354461436431322109768803622742222541241625342952463371124400375288617140673609748224490873164023427658497034785298573432999342763340236494421083217996994864002628244629669, 526559119782958296059390900013554951887949478366597723644272174515146735211654051850383918185808130940643725336275399983611754120910294408189964522956397953388825869156145683443799002155115566634577514525790467715694847832416284531984825071186248279982638138445196187583087241386681432517301572271171410628230554696784287127152444433677979444691681760585867070206942947782636104017093577747216886019404609307044656933842184430161028083353203112953999271707482096338039167340769555607338872116104208820395951435738268294631719014597707569705046874712913986932838434323824943055454112965509702290243445535609935319110022828074663300856039867862113491001023606298907296263371616231217407778515096]);

QA=E0([-PA[0], a*PA[1]]);

QB=E0([-PB[0], a*PB[1]]);

R_A = PA - QA;

R_B = PB - QB;

T2 = time.time();
 
degree_bound = 211;

# Isogeny from E_0 to E_6

def iso_from_0_to_6(X1, Z1):
	t0 = a + 1;
	t1 = a - 1;
	t2 = X1 + Z1;
	t3 = X1 - Z1;
	t0 = t0 * t3;
	t1 = t1 * t2;
	t2 = t0 + t1;
	t3 = t0 - t1;
	X1 = X1 * t2;
	Z1 = Z1 * t3;
	return X1, Z1;

# Dual isogeny from E_6 to E_0

def dual_iso_from_6_to_0(X1, Z1):
  t0 = X1 + Z1;
  X2 = t0^2;
  t1 = X1 - Z1;
  t1 = t1^2;
  t1 = X2 - t1;
  Z2 = G(a * t1); 
  return X2, Z2;
    
[xPA , zPA] = iso_from_0_to_6(PA[0], PA[2]);

[xQA , zQA] = iso_from_0_to_6(QA[0], QA[2]);

[xR_A , zR_A] = iso_from_0_to_6(R_A[0], R_A[2]);

[xPB , zPB] = iso_from_0_to_6(PB[0], PB[2]);

[xQB , zQB] = iso_from_0_to_6(QB[0], QB[2]);

[xR_B , zR_B] = iso_from_0_to_6(R_B[0], R_B[2]);

xPA = xPA/zPA;

xQA = xQA/zQA;

xR_A = xR_A/zR_A;

xPB = xPB/zPB;

xQB = xQB/zQB;

xR_B = xR_B/zR_B;

# Square root in F_{p^2}

def sqrFp2(x):
     [r, i] = x.polynomial().list();
     delta = r^2 + i^2;
     lamb = delta^((p - 3)/4);
     rho = delta * lamb;
     if rho^2 != delta:
         return 0;
     gamma = (r + rho)/2;
     if gamma == 0:
         gamma = -rho;
     mu = gamma^((p - 3)/4);
     sigma = gamma * mu;
     gamma_inv = sigma * mu^3;
     tau = sigma * gamma_inv;
     omega = (i/2)*tau;
     if sigma^2 == gamma:
         return sigma + omega * a;
     else:
         return omega - sigma*a;

# Point doubling

def xDBL(X1, Z1, A24, C24):
	t0 = X1 - Z1; t1 = X1 + Z1;
	t0 = t0^2;
	t1 = t1^2;
	Z1 = C24 * t0;
	X1 = t1 * Z1;
	t1 = t1 - t0;
	t0 = A24 * t1;
	Z1 = Z1 + t0;
	Z1 = Z1 * t1;
	return X1, Z1;

# Point doubling and point addition

def xDBLADD(X1, Z1, X2, Z2, X3, Z3, A24):
	t0 = X1 + Z1; t1 = X1 - Z1;
	X4 = t0^2;
	t2 = X2 - Z2; 
	X5 = X2 + Z2;
	t0 = t0 * t2;
	Z4 = t1^2;
	t1 = t1 * X5; t2 = X4 -Z4;
	X4 = X4 * Z4;
	X5 = A24 * t2;
	Z5 = t0 - t1;
	Z4 = X5 + Z4;
	X5 = t0 + t1;
	Z4 = Z4 * t2;
	Z5 = Z5^2;
	X5 = X5^2;
	Z5 = X3 * Z5;
	X5 = Z3 * X5;
	return X4, Z4, X5, Z5;
	

# Montgomery ladder

def Montgomery_ladder(ell, A, XP, ZP):
	X1 = XP;
	Z1 = ZP;
	A24 = A + G(2);
	C24 = G(4);
	X2, Z2 = xDBL(X1, Z1, A24, C24);
	ellbits = bin(ell);
	ellbits = tuple(ellbits);
	ellbits = ellbits[3:];
	l = len(ellbits);
	A24 = A24/C24;
	for j in range(l):
		if ellbits[j] == '1': 
			[X2, Z2, X1, Z1] = xDBLADD(X2, Z2, X1, Z1, XP, ZP, A24);
		else:
			[X1, Z1, X2, Z2] = xDBLADD(X1, Z1, X2, Z2, XP, ZP, A24);
	return X1, Z1, X2, Z2;

# Differential addition

def differential_addition_Montgomery_plus(X1, Z1, X2, Z2, X3, Z3, A0):
  if X1 == 0 or Z1 == 0 or [X2,Z2] == [0,0] or [X3,Z3] == [0,0]:
    return 0, 0;
  else:
    t0 = X1 + Z1; t1 = X1 - Z1;
    X4 = t0^2;
    t2 = X2 - Z2; 
    X5 = X2 + Z2;
    t0 = t0 * t2;
    Z4 = t1^2;
    t1 = t1 * X5; t2 = X4 - Z4;
    X4 = X4 * Z4;
    X5 = ((A0 + G(2))/G(4)) * t2;
    Z5 = t0 - t1;
    Z4 = X5 + Z4;
    X5 = t0 + t1;
    Z4 = Z4 * t2;
    Z5 = Z5^2;
    X5 = X5^2;
    Z5 = X3 * Z5;
    X5 = Z3 * X5;
    return X5,Z5;

# Point doubling

def double_point_Montgomery_plus(X2, Z2, A0):
  if Z2 == 0 or X2^3+A0*X2^2+X2 == 0:
    return 0, 0;
  else:
    return (X2^2-Z2^2)^2, 4*X2*Z2*(X2^2+A0*X2*Z2+Z2^2);

# Three point ladder

def Ladder3pt_M(sk, X1, X2, X3, A0):
	Z1 = G(1);
	Z2 = G(1);
	Z3 = G(1);
	skbits = bin(sk);
	skbits = tuple(skbits);
	skbits = skbits[2:];
	l = len(skbits);
	A24 = A0 + G(2);
	C24 = G(4);
	A24 = A24/C24;
	for j in range(l):
		if skbits[l-1-j] == '1': 
			[X1,Z1,X2,Z2] = xDBLADD(X1, Z1, X2, Z2, X3, Z3, A24);
		else:
			[X1,Z1,X3,Z3] = xDBLADD(X1, Z1, X3, Z3, X2, Z2, A24);
	return X2, Z2;

def recover_y3(X0, Y0, X1, Z1, X2, Z2, A):
	x = X0;
	y = Y0;
	t1 = x * Z1;
	t2 = X1 + t1;
	t3 = X1 - t1;
	t3 = t3^2;
	t3 = t3 * X2;
	t1 = 2 * Z1;
	t1 = t1 * A;
	t2 = t1 + t2;
	t4 = x * X1;
	t4 = t4 + Z1;
	t2 = t2 * t4;
	t1 = t1 * Z1;
	t2 = t2 - t1;
	t2 = t2 * Z2;
	Y = t2 - t3;
	t1 = 2 * y;
	t1 = t1 * Z1;
	t1 = t1 * Z2;
	X = X1 * t1;
	Z = Z1 * t1;
	if X == 0 and Y ==0 and Z == 0:
		Y = G(1);
	return X, Y, Z;


def plus_Q(X1, Y1, Z1, xQ, yQ):
	t1 = xQ * Z1;
	t2 = X1 - t1;
	t2 = t2^2;
	Z = Z1 * t2;
	t1 = X1 + t1;
	t2 = t1 * t2;
	t1 = yQ * Z1;
	t1 = Y1 - t1;
	t1 = t1^2;
	t1 = Z1 * t1;
	X = t1 - t2;
	return X,Z;

def step_zero_Montgomery_plus(X1, Z1, X2, Z2, X3, Z3, A0):
  return (X2^2-Z2^2)^2, 4*X2*Z2*(X2^2+A0*X2*Z2+Z2^2), 4*(X2*X3-Z2*Z3)^2*Z1, 4*(X2*Z3-Z2*X3)^2*X1;
  
def step_one_Montgomery_plus(X1, Z1, X3, Z3, X2, Z2, A0):
  return 4*(X2*X3-Z2*Z3)^2*Z1, 4*(X2*Z3-Z2*X3)^2*X1, (X2^2-Z2^2)^2, 4*X2*Z2*(X2^2+A0*X2*Z2+Z2^2);

# Scalar multiplication
  
def scalar_multiplication_Montgomery_plus(n, X1, Z1, A0):
  X2 = 1; Z2 = 0; X3 = X1; Z3 = Z1;
  nbits = [];
  while(n >= 1):
    nbits.append(n % 2);
    n = n // 2;
  nbits.reverse();
  if Z1 == 0:  
    print("Error");
  else:
    for i in range(len(nbits)):
      if nbits[i] == 0: 
        X2, Z2, X3, Z3 = step_zero_Montgomery_plus(X1, Z1, X2, Z2, X3, Z3, A0);
      else:
        X2, Z2, X3, Z3 = step_one_Montgomery_plus(X1, Z1, X2, Z2, X3, Z3, A0);
  return X2, Z2;
    
def F0(X1,X2,X3):
    return (X3*X1-X2)^2

def F1(X1,X2,X3,A0):
    return -2*((X1*X2+X3)*(X1*X3+X2)+2*A0*X1*X2*X3)

def F2(X1,X2,X3):
    return (X1*X2-X3)^2

# Compute I, J, K

def IJK(XP, ZP, l, A0):
  S = set(range(1,l-1,2));
  b = floor(sqrt(l - 1)/2);
  if b == 0:
    b2 = 0;
  else:
    b2 = floor((l - 1)/(4*b));
  I = set(2*b*(2*i + 1) for i in range(b2));
  J = set(2*j+1 for j in range(b));
  K = set(range(4*b*b2+1,l-1,2));
  xS = {s:scalar_multiplication_Montgomery_plus(s, XP, ZP, A0) for s in K.union(I).union(J)}
  return [xS, I, J, K];
  
 
# Compute hI(x) = \prod_{i \in I} (x - x_i)
 
def h_I(x1, I):
  hI = GX(prod(x1[i][1]*X-x1[i][0] for i in I));
  return hI;
 
# Compute hS(x)
 
def hS_for_iso(x1, alpha, A0, J, K, hI):
  EJ = GX(prod(F0(X,x1[j][0],x1[j][1])*alpha^2+F1(X,x1[j][0],x1[j][1],A0)*alpha+F2(X,x1[j][0],x1[j][1]) for j in J));
  R = hI.resultant(EJ);
  hK = prod(alpha*x1[s][1]-x1[s][0] for s in K);
  return hK*R;
  

# Large prime degree isogeny
  
def x_val_big(x1, l, X1, Z1, A0, J, K, hI):
  E_0J = GX(prod(F0(X,x1[j][0],x1[j][1])*Z1^2+F1(X,x1[j][0],x1[j][1],A0)*X1*Z1+F2(X,x1[j][0],x1[j][1])*X1^2 for j in J));
  E_1J = GX(prod(F0(X,x1[j][0],x1[j][1])*X1^2+F1(X,x1[j][0],x1[j][1],A0)*X1*Z1+F2(X,x1[j][0],x1[j][1])*Z1^2 for j in J));
  R0 = hI.resultant(E_0J);
  R1 = hI.resultant(E_1J);
  hK0 = prod(Z1*x1[s][1]- X1*x1[s][0] for s in K);
  hK1 = prod(X1*x1[s][1]- Z1*x1[s][0] for s in K);
  newX1 = X1 * (hK0 * R0)^2;
  newZ1 = Z1 * (hK1 * R1)^2;
  return newX1, newZ1;
  
def x_iso_big(x1, l, A0, J, K, hI):
  newA0 = 2*((A0 + 2)^l*hS_for_iso(x1, G(-1), A0, J, K, hI)^8 + (A0 - 2)^l*hS_for_iso(x1, G(1), A0, J, K, hI)^8)/((A0 + 2)^l*hS_for_iso(x1, G(-1), A0, J, K, hI)^8 - (A0 - 2)^l*hS_for_iso(x1, G(1), A0, J, K, hI)^8);
  return newA0;
 
# Small prime degree isogeny  
 
def x_val_small(XP, ZP, l, X1, Z1, A0):
  XQ = XP; ZQ = ZP;
  f1 = (X1*XQ - Z1*ZQ); f2 = (X1*ZQ - Z1*XQ);
  if l == 3:
    return X1 * f1^2, Z1 * f2^2;
  else:
    [XDBL, ZDBL] = double_point_Montgomery_plus(XQ, ZQ, A0);
    [XQ, ZQ] = differential_addition_Montgomery_plus(XDBL, ZDBL, XQ, ZQ, XQ, ZQ, A0);
    f1 *= (XQ*X1 - ZQ * Z1); f2 *= (ZQ*X1 - XQ * Z1);
    XPrev = XP; ZPrev = ZP;
    for i in range (3, (l - 1)//2 + 1):
        XTemp = XQ;
        ZTemp = ZQ;
        [XQ, ZQ] = differential_addition_Montgomery_plus(XQ, ZQ, XDBL, ZDBL, XPrev, ZPrev, A0);
        f1 *= (XQ*X1 - ZQ * Z1); f2 *= (ZQ*X1 - XQ*Z1);
        XPrev = XTemp; ZPrev = ZTemp;
  return X1 * f1^2, Z1 * f2^2;


def x_iso_small(XP, ZP, l, A0):
  XQ = XP; ZQ = ZP;
  pi = XQ/ZQ; sigma = (XQ^2 - ZQ^2)/(XQ*ZQ);
  if l == 3:
    return pi^2 * (A0 - 6*sigma);
  else:
    [XQ, ZQ] = double_point_Montgomery_plus(XQ, ZQ, A0);
    xQ = XQ/ZQ;
    pi *= xQ; sigma += xQ - 1/xQ;
    XPrev = XP; ZPrev = ZP;
    for i in range (3, (l - 1)//2 + 1):
        XTemp = XQ;
        ZTemp = ZQ;
        [XQ, ZQ] = differential_addition_Montgomery_plus(XQ, ZQ, XP, ZP, XPrev, ZPrev, A0);
        xQ = XQ/ZQ;
        pi *= xQ; sigma += xQ - 1/xQ;
        XPrev = XTemp; ZPrev = ZTemp;
  return pi^2 * (A0 - 6*sigma);

 
# Input: E6, P_B, Q_B, R_B, Q_A
# Output: \phi_A(Q_A), EA
  
def msidh_action_Alice(A0, XPush, private_key, degree_bound, X1, X2, Y1, Y2, XPre, APre):
  S = []; 
  [t1, t2, t3, t4] = Montgomery_ladder(private_key, G(0), X1, G(1));
  [xR, yR, zR] = recover_y3(X1, Y1, t1, t2, t3, t4, G(0));
  [X3, Z3] = plus_Q(xR, yR, zR, X2, Y2);
  [X4, Z4] = iso_from_0_to_6(X3, Z3);
  S.append([128, [X4, Z4]]);
  i = 0;
  Aimage = A0;
  APre.append(Aimage);
  while S != []:
    [h, [XP, ZP]] = S[0];
    S.pop(0);
    if h == 1 and S != []:
      ATemp = Aimage;
      if prime_A[len(prime_A) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        hI = h_I(x1, I);
        Aimage = x_iso_big(x1, prime_A[len(prime_A) - i], ATemp, J, K, hI);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_big(x1,  prime_A[len(prime_A) - i], xTemp1 , zTemp1,  ATemp, J, K, hI);
          S1.insert(0, [h - 1, [XP,ZP]]);
        S = S1;
        for j in range(4):    
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_A[len(prime_A) - i], XPush[j][0], XPush[j][1] , ATemp, J, K, hI);
        [xPush, zPush] = [XPush[3][0], XPush[3][1]];
        for j in range(len(prime_A) - i):
            [xPush, zPush] = scalar_multiplication_Montgomery_plus(prime_A[j], xPush, zPush, Aimage);      
        XPre.append([xPush,zPush]);   
        APre.append(Aimage);
      else:
        Aimage = x_iso_small(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_small(XP, ZP, prime_A[len(prime_A) - i], xTemp1 , zTemp1, ATemp);
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
        for j in range(4):
            [XPush[j][0], XPush[j][1]] = x_val_small(xTemp2, zTemp2, prime_A[len(prime_A) - i], XPush[j][0], XPush[j][1] , ATemp);
        [xPush, zPush] = [XPush[3][0], XPush[3][1]];
        for j in range(len(prime_A) - i):
          [xPush, zPush] = scalar_multiplication_Montgomery_plus(prime_A[j], xPush, zPush, Aimage);         
        XPre.append([xPush,zPush]);
        APre.append(Aimage);
    elif h == 1 and S == []: 
      ATemp = Aimage;
      i = i + 1;
      if prime_A[len(prime_A) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        hI = h_I(x1, I);
        Aimage = x_iso_big(x1, prime_A[len(prime_A) - i], ATemp, J, K, hI);
        for j in range(4):
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_A[len(prime_A) - i], XPush[j][0], XPush[j][1] , ATemp,  J, K, hI);
        XPre.append([XPush[3][0], XPush[3][1]]);
        APre.append(Aimage);
      else:
        Aimage = x_iso_small(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        for j in range(4):
            [XPush[j][0], XPush[j][1]] = x_val_small(XP, ZP, prime_A[len(prime_A) - i], XPush[j][0], XPush[j][1] , ATemp); 
        XPre.append([XPush[3][0], XPush[3][1]]);
        APre.append(Aimage);
    elif s[i] > 0 and s[i] < h:
      S.insert(0, [h, [XP, ZP]]);
      for j in range(s[i]):
          [XP, ZP] = scalar_multiplication_Montgomery_plus(prime_A[j], XP, ZP, Aimage);
      S.insert(0, [h - s[i], [XP, ZP]]);
      i = i + 1;
  for i in range(4):
      XPush[i] = XPush[i][0]/XPush[i][1];
  return Aimage, XPush, XPre, APre;
 
# Input: EB, U, V, SA(the result of the discrete logarithm computation)
# Output: EBA

def msidh_action_Alice_last(A0, private_key, degree_bound, U, V, C1, C2, C3, C4):
  S = [];
  P = (C1 + C2 * private_key)*U + (C3 + C4 * private_key)*V;
  [X4, Z4] = [P[0], P[2]];
  S.append([128, [X4, Z4]]);
  i = 0;
  Aimage = A0;
  while S != []:
    [h, [XP,ZP]] = S[0];
    S.pop(0);
    if h == 1 and S != []:
      ATemp = Aimage;
      if prime_A[len(prime_A) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        hI = h_I(x1, I);
        Aimage = x_iso_big(x1, prime_A[len(prime_A) - i], ATemp, J, K, hI);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_big(x1,  prime_A[len(prime_A) - i], xTemp1 , zTemp1,  ATemp,J, K, hI);
          S1.insert(0, [h - 1, [XP,ZP]]);
        S = S1;
      else:
        Aimage = x_iso_small(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_small(XP, ZP, prime_A[len(prime_A) - i], xTemp1 , zTemp1, ATemp);
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
    elif h == 1 and S == []: 
      ATemp = Aimage;
      i = i + 1;
      if prime_A[len(prime_A) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        hI = h_I(x1, I);
        Aimage = x_iso_big(x1, prime_A[len(prime_A) - i], ATemp,J, K, hI);
      else:
        Aimage = x_iso_small(XP, ZP, prime_A[len(prime_A) - i], ATemp);
    elif s[i] > 0 and s[i] < h:
      S.insert(0, [h, [XP, ZP]]);
      for j in range(s[i]):
          [XP, ZP] = scalar_multiplication_Montgomery_plus(prime_A[j], XP, ZP, Aimage);
      S.insert(0, [h - s[i], [XP, ZP]]);
      i = i + 1;
  return Aimage;

# Input: E6, P_A, Q_A, R_A, Q_B
# Output: \phi_B(Q_B), EB
  
def msidh_action_Bob(A0, XPush, private_key, degree_bound, X1, X2, Y1, Y2, XPre, BPre):
  S = [];
   #[t1, t2, t3, t4] = Ladder3pt_M_for_P(private_key, G(0), X1);
  [t1, t2, t3, t4] = Montgomery_ladder(private_key, G(0), X1, G(1));
  #[xR, yR, zR] = recover_y3(t1, t2, t3, t4, X1, Y1);
  [xR, yR, zR] = recover_y3(X1, Y1, t1, t2, t3, t4, G(0));
  [X3, Z3] = plus_Q(xR, yR, zR, X2, Y2);
  [X4, Z4] = iso_from_0_to_6(X3, Z3);
  S.append([128, [X4, Z4]]);
  i = 0;
  Bimage = A0;
  BPre.append(Bimage);
  while S != []:
    [h, [XP, ZP]] = S[0];
    S.pop(0);
    if h == 1 and S != []:
      BTemp = Bimage;
      if prime_B[len(prime_B) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        hI = h_I(x1, I);
        Bimage = x_iso_big(x1, prime_B[len(prime_B) - i], BTemp, J, K, hI);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_big(x1,  prime_B[len(prime_B) - i], xTemp1 , zTemp1,  BTemp, J, K, hI);
          S1.insert(0, [h - 1, [XP,ZP]]);
        S = S1;
        for j in range(4):
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_B[len(prime_B) - i], XPush[j][0], XPush[j][1] , BTemp, J, K, hI);
        [xPush, zPush] = [XPush[3][0], XPush[3][1]];
        for j in range(len(prime_B) - i):
            [xPush, zPush] = scalar_multiplication_Montgomery_plus(prime_B[j], xPush, zPush, Bimage);      
        XPre.append([xPush,zPush]);   
        BPre.append(Bimage);
      else:
        Bimage = x_iso_small(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_small(XP, ZP, prime_B[len(prime_B) - i], xTemp1 , zTemp1, BTemp);
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
        for j in range(4):
            [XPush[j][0], XPush[j][1]] = x_val_small(xTemp2, zTemp2, prime_B[len(prime_B) - i], XPush[j][0], XPush[j][1] , BTemp);
        [xPush, zPush] = [XPush[3][0], XPush[3][1]];
       
        for j in range(len(prime_B) - i):
          [xPush, zPush] = scalar_multiplication_Montgomery_plus(prime_B[j], xPush, zPush, Bimage);         
        XPre.append([xPush,zPush]);
        BPre.append(Bimage);
    elif h == 1 and S == []: 
      BTemp = Bimage;
      i = i + 1;
      if prime_B[len(prime_B) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        hI = h_I(x1, I);
        Bimage = x_iso_big(x1, prime_B[len(prime_B) - i], BTemp, J, K, hI);
        for j in range(4):
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_B[len(prime_B) - i], XPush[j][0], XPush[j][1] , BTemp,  J, K, hI); 
        XPre.append([XPush[3][0], XPush[3][1]]);
        BPre.append(Bimage);
      else:
        Bimage = x_iso_small(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        for j in range(4):
            [XPush[j][0], XPush[j][1]] = x_val_small(XP, ZP, prime_B[len(prime_B) - i], XPush[j][0], XPush[j][1] , BTemp); 
        XPre.append([XPush[3][0], XPush[3][1]]);
        BPre.append(Bimage);
    elif s[i] > 0 and s[i] < h:
      S.insert(0, [h, [XP, ZP]]);
      for j in range(s[i]):
          [XP, ZP] = scalar_multiplication_Montgomery_plus(prime_B[j], XP, ZP, Bimage);
      S.insert(0, [h - s[i], [XP, ZP]]);
      i = i + 1;
  for i in range(4):
      XPush[i] = XPush[i][0]/XPush[i][1];
  return Bimage, XPush, XPre, BPre;
  
# Input: EA, U, V, SB(the result of the discrete logarithm computation)
# Output: EAB 

def msidh_action_Bob_last(A0, private_key, degree_bound, U, V, C1, C2, C3, C4):
  S = [];
  P = (C1 + C2 * private_key)*U + (C3 + C4 * private_key)*V;
  [X4, Z4] = [P[0], P[2]];
  S.append([128, [X4, Z4]]);
  i = 0;
  Bimage = A0;
  while S != []:
    [h, [XP,ZP]] = S[0];
    S.pop(0);
    if h == 1 and S != []:
      BTemp = Bimage;
      if prime_B[len(prime_B) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        hI = h_I(x1, I);
        Bimage = x_iso_big(x1, prime_B[len(prime_B) - i], BTemp, J, K, hI);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_big(x1,  prime_B[len(prime_B) - i], xTemp1 , zTemp1,  BTemp,J, K, hI);
          S1.insert(0, [h - 1, [XP,ZP]]);
        S = S1;
      else:
        Bimage = x_iso_small(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_small(XP, ZP, prime_B[len(prime_B) - i], xTemp1 , zTemp1, BTemp);
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
    elif h == 1 and S == []: 
      BTemp = Bimage;
      i = i + 1;
      if prime_B[len(prime_B) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        hI = h_I(x1, I);
        Bimage = x_iso_big(x1, prime_B[len(prime_B) - i], BTemp,J, K, hI);
      else:
        Bimage = x_iso_small(XP, ZP, prime_B[len(prime_B) - i], BTemp);
    elif s[i] > 0 and s[i] < h:
      S.insert(0, [h, [XP, ZP]]);
      for j in range(s[i]):
          [XP, ZP] = scalar_multiplication_Montgomery_plus(prime_B[j], XP, ZP, Bimage);
      S.insert(0, [h - s[i], [XP, ZP]]);
      i = i + 1;
  return Bimage;

# Compute the dual isogeny of \phi_A

def msidh_action_Alice_dual(A0, XPush, degree_bound, XPre, APre):
  S = [];
  S.append([128, [XPre[0][0],XPre[0][1]]]);
  i = 0;
  Aimage = APre[0];
  while S != []:
    [h, [XP, ZP]] = S[0];
    S.pop(0);
    if h == 1 and S != []:
      ATemp = Aimage;
      if prime_A[len(prime_A) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP,ZP, prime_A[len(prime_A) - i], ATemp);
        hI = h_I(x1, I);
        Aimage = APre[i];
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_big(x1,  prime_A[len(prime_A) - i], xTemp1 ,zTemp1,  ATemp, J, K, hI);
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_A[len(prime_A) - i], XPush[j][0] , XPush[j][1], ATemp, J, K, hI);
      else:
        Aimage = APre[i];
        S1 = [];
        while S != []:
          h = S[len(S)-1][0];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = [XPre[i][0], XPre[i][1]];
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_small(xTemp2, zTemp2, prime_A[len(prime_A) - i], XPush[j][0], XPush[j][1] , ATemp);
    elif h == 1 and S == []: 
      ATemp = Aimage;
      i = i + 1;
      if prime_A[len(prime_A) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_A[len(prime_A) - i], ATemp);
        hI = h_I(x1, I);
        Aimage = APre[i]
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_A[len(prime_A) - i], XPush[j][0], XPush[j][1] , ATemp,  J, K, hI);
      else:
        Aimage = APre[i];
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_small(XP, ZP, prime_A[len(prime_A) - i], XPush[j][0], XPush[j][1], ATemp);   
    elif s[i] > 0 and s[i] < h:
      S.insert(0, [h, [XP, ZP]]);
      for j in range(s[i]):
          [XP, ZP] = scalar_multiplication_Montgomery_plus(prime_A[j], XP, ZP, Aimage);
      S.insert(0, [h - s[i], [XP, ZP]]);
      i = i + 1;
  return Aimage, XPush;

# Compute the dual isogeny of \phi_B

def msidh_action_Bob_dual(A0, XPush, degree_bound, XPre, BPre):
  S = [];
  S.append([128, [XPre[0][0],XPre[0][1]]]);
  i = 0;
  Bimage = BPre[0];
  while S != []:
    [h, [XP, ZP]] = S[0];
    S.pop(0);
    if h == 1 and S != []:
      BTemp = Bimage;
      if prime_B[len(prime_B) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP,ZP, prime_B[len(prime_B) - i], BTemp);
        hI = h_I(x1, I);
        Bimage = BPre[i];
        S1 = [];
        while S != []:
          [h, [xTemp1, zTemp1]] = S[len(S)-1];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = x_val_big(x1,  prime_B[len(prime_B) - i], xTemp1 ,zTemp1,  BTemp, J, K, hI);
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_B[len(prime_B) - i], XPush[j][0] , XPush[j][1], BTemp, J, K, hI);
      else:
        Bimage = BPre[i];
        S1 = [];
        while S != []:
          h = S[len(S)-1][0];
          [xTemp2, zTemp2] = [XP, ZP];
          S.pop();
          [XP, ZP] = [XPre[i][0], XPre[i][1]];
          S1.insert(0, [h - 1, [XP, ZP]]);
        S = S1;
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_small(xTemp2, zTemp2, prime_B[len(prime_B) - i], XPush[j][0], XPush[j][1] , BTemp);
    elif h == 1 and S == []: 
      BTemp = Bimage;
      i = i + 1;
      if prime_B[len(prime_B) - i] >= degree_bound:
        [x1, I, J, K] = IJK(XP, ZP, prime_B[len(prime_B) - i], BTemp);
        hI = h_I(x1, I);
        Bimage = BPre[i];
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_big(x1, prime_B[len(prime_B) - i], XPush[j][0], XPush[j][1] , BTemp,  J, K, hI);
      else:
        Bimage = BPre[i];
        for j in range(3):
            [XPush[j][0], XPush[j][1]] = x_val_small(XP, ZP, prime_B[len(prime_B) - i], XPush[j][0], XPush[j][1], BTemp);   
    elif s[i] > 0 and s[i] < h:
      S.insert(0, [h, [XP, ZP]]);
      for j in range(s[i]):
          [XP, ZP] = scalar_multiplication_Montgomery_plus(prime_B[j], XP, ZP, Bimage);
      S.insert(0, [h - s[i], [XP, ZP]]);
      i = i + 1;
  return Bimage, XPush;
  
# Compute the j-invariant

def J(MA):
  return 256*(MA^2 - 3)^3 / (MA^2 - 4);

# Lucas sequences (Algorithm 1)
def Lucassequences(f,ell):
	v0 = G(2);
	tmp1 = f;
	v1 = tmp1;
	tmp2 = G(2);
	string = ell.str(base=2);
	Len = len(string);
	for j in range(Len):
		if string[j] == '1':
			v0 = v0 * v1 - tmp1;
			v1 = v1 * v1 - tmp2;
		else:
			v1 = v0 * v1 - tmp1;
			v0 = v0 * v0 - tmp2;
	return v0;

# Lucas sequences (Algorithm 1), but return v1 as well	
def Lucassequences2(f,ell):
	v0 = 2;
	tmp1 = f + f^-1;
	v1 = tmp1;
	tmp2 = G(2);
	string = ell.str(base=2);
	Len = len(string);
	for j in range(Len):
		if string[j] == '1':
			v0 = v0 * v1 - tmp1;
			v1 = v1 * v1 - tmp2;
		else:
			v1 = v0 * v1 - tmp1;
			v0 = v0 * v0 - tmp2;
	return v0, v1;
	
# Exponentiation using Lucas sequences (Algorithm 2)
def ELS(f,ell):
	if ell < 100000000000000000000000000:
		return f^ell;
	else:
		[tmp1,tmp2] = Lucassequences2(f,ell-1);
		tmp1 = tmp1/G(2); 
		tmp2 = tmp2/G(2);
		re = tmp2;
		f0 = (f.polynomial().list())[0];
		f1 = f - f0;		
		tmp2 = tmp2 * f0 - tmp1;
		tmp2 = tmp2* (f0^2-1)^(-1);
		im = tmp2 * f1;
		return re + im;

# elligator: randomly generate a point
def elligator(A, E):
  flag_2 = 0;
  u = 1 + a;
  while flag_2 == 0:
    r0 = random.randint(0, p);
    r1 = random.randint(0, p);
    r = r0 + r1 * a;
    tmp = u * r^2;
    cond1 = 1 + tmp;
    cond2l = A^2 * tmp;
    cond2r = cond1^2;
    if cond1 != 0 and cond2l != cond2r:
      v = -A/cond1;
      e = is_square(v * (v^2 + A*v + G(1)));
    if e == False:
       e = -1;
    else:
      e = 1;
    x = e * v - (1 - e)*(A/G(2));
    y = - e * sqrFp2(x * (x^2 + A * x + 1));
    flag_2 = 1;
  return E([x,y]);

# Batch cofactor exponentiation using trace (Algorithm 5)
def batch_cof_trace(fi,f,ind,n, L):
	if n == 1:
		fi.append(f);
		return 1;
	m=floor(n/2);
	u=1;
	v=1;
	for i in range(m):
		u=L[ind[i]]*u;
	for j in range(m,n):
		v=L[ind[j]]*v;
	left=Lucassequences(f,u);
	right=Lucassequences(f,v);
	batch_cof_trace(fi,left,[ind[i] for i in range(m,n)],n-m, L);
	batch_cof_trace(fi,right,[ind[i] for i in range(m)],m, L);

# Batch cofactor exponentiation in the cyclic group (Algorithm 8)
def batch_cof(fi,f,ind,n, L):
	if n == 1:
		fi.append(f);
		return 1;
	m=floor(n/2);
	u=1;
	v=1;
	for i in range(m):
		u=L[ind[i]]*u;
	for j in range(m,n):
		v=L[ind[j]]*v;
	left=ELS(f,u);
	right=ELS(f,v);
	batch_cof(fi,left,[ind[i] for i in range(m,n)],n-m, L);
	batch_cof(fi,right,[ind[i] for i in range(m)],m, L);

# Batch cofactor multiplication (Algorithm 4)
# Output:{Ui},the order of each point is ln,ln-1,...,l1.
def batch_cof_mul(Ui,U,ind,n,A, E, L):
    if n == 1:
        Ui.append(U);
        return 1;
    m=floor(n/2);
    u=1;
    v=1;
    for i in range(m):
        u=L[ind[i]]*u;
    for j in range(m,n):
        v=L[ind[j]]*v;
    R0X, R0Z, R1X, R1Z = Montgomery_ladder(u, A, U[0], U[2]);
    UX, UY, UZ = recover_y3(U[0], U[1], R0X, R0Z, R1X, R1Z, A);
    left = E([UX, UY, UZ]);
    R0X, R0Z, R1X, R1Z = Montgomery_ladder(v, A, U[0], U[2]);
    UX, UY, UZ = recover_y3(U[0], U[1], R0X, R0Z, R1X, R1Z, A);
    right = E([UX, UY, UZ]);
    batch_cof_mul(Ui,left,[ind[i] for i in range(m,n)],n-m, A, E, L);
    batch_cof_mul(Ui,right,[ind[i] for i in range(m)],m, A, E, L);

# Generate U 
def generate_U(Uj,A, ind, E, L, N):
	R=elligator(A, E); 
	R0X, R0Z, R1X, R1Z = Montgomery_ladder(4*N,A,R[0],R[2]);
	UX, UY, UZ = recover_y3(R[0], R[1], R0X, R0Z, R1X, R1Z, A);
	U = E([UX,UY,UZ]);
	n=len(ind);
	batch_cof_mul(Uj,U,ind,n,A, E, L);
	Iu=[];
	for i in range(n):
		if Uj[i] == E([0,1,0]):
			Iu.append(127-i);
	Seed = 1;
	while len(Iu) !=0:
		random.seed(int(Seed));
		R = elligator(A, E);
		R0X, R0Z, R1X, R1Z = Montgomery_ladder(4*N,A,R[0],R[2]);
		UX, UY, UZ = recover_y3(R[0], R[1], R0X, R0Z, R1X, R1Z, A);
		U1 = E([UX,UY,UZ]);
		Uj1=[];
		n=len(Iu);
		prime_prod = 1;
		for i in list(set(ind)-set(Iu)):
			prime_prod = prime_prod * L[i];
		R0X, R0Z, R1X, R1Z = Montgomery_ladder(prime_prod,A,U1[0],U1[2]);
		UX, UY, UZ = recover_y3(U1[0], U1[1], R0X, R0Z, R1X, R1Z, A);
		U1 = E([UX,UY,UZ]);
		batch_cof_mul(Uj1,U1,Iu,n,A, E, L);
		tmp=Iu;
		Iu=[];
		for i in range(n):
			if Uj1[i] != E([0,1,0]):
				U = U+Uj1[i];
				Uj[127-tmp[i]]=Uj1[i];
			else:
				Iu.append(tmp[i]);
		Seed += 1;
	return U;
       
# Generate V 
def generate_V(A,ind,U,Uj, E, primelist, N):
    V = elligator(A, E); 
    if N == NA:
      string_N = string_A;
    else:
      string_N = string_B;
    f = compressed_pairing(U,V,string_N,N, A);
    fj = [];
    n = len(ind);
    batch_cof_trace(fj,f,ind,n, primelist);
    Iv = [];
    for i in range(n):
        if fj[i] == 2:
            Iv.append(127-i);
    Seed = 1;
    while len(Iv) != 0:
        random.seed(int(Seed));
        V1 = elligator(A, E); 
        U1 = E([0,1,0]);
        L = 1;
        for i in Iv:
            U1 = U1 + Uj[127-i];
            L = L * primelist[i];
        n = len(Iv);
        string_L = (L).str(base=2);
        f1 = compressed_pairing(U1,V1,string_L,L, A);
        fj1 = [];
        batch_cof_trace(fj1,f1,Iv,n, primelist);
        flag = 0;
        for i in range(n):
          if fj[i] != 2:
            flag = 1;
        if flag == 1:
          prime_prod = 1;
          for k in list(set(ind)-set(Iv)):
            prime_prod = prime_prod * primelist[k];
          R0X, R0Z, R1X, R1Z = Montgomery_ladder(prime_prod,A,V1[0],V1[2]);
          VX, VY, VZ = recover_y3(V1[0], V1[1], R0X, R0Z, R1X, R1Z, A);
          V1 = E([VX,VY,VZ]);
          tmp = Iv;
          Iv = [];
          Vj1 = [];
          batch_cof_mul(Vj1,V1,tmp,n,A, E, primelist);
          for j in range(n):
              if fj1[j] == 2:
                  Iv.append(tmp[n-1-j]);
              else:
                  V = V+Vj1[j];
          Seed += 1;
    return V;

# Pairing
def miller_affine(P,Q,string,r, A):
    (Px,Py,Pz)=P;
    (Qx,Qy,Qz)=Q;
    f1=G(1);
    Rx=Px;
    Ry=Py;

    l=len(string);
    flag=0;
    for i in range(1,l):
        lamb=(3*Rx^2+2*A*Rx+1)/(2*Ry);

        f1 = f1^2*(Qy-Ry-lamb*(Qx-Rx));

        Nx = lamb^2-2*Rx-A;
        Ny = lamb*(Rx-Nx)-Ry;

        Rx = Nx;
        Ry = Ny;
        if Qx != Rx:
            f1 = f1/(Qx-Rx);
        else:
            flag=1;
        if string[i] == '1' and i != l-1:
            if Rx != Px:
                lamb_1 =(Ry-Py)/(Rx-Px);
            else:
                lamb_1 = 1;
                flag = 1;
            f1 = f1*(Qy-Py-lamb_1*(Qx-Px));
            Nx = lamb_1^2-(Rx+Px)-A;
            Ny = lamb_1*(Px-Nx)-Py;
            Rx = Nx;
            Ry = Ny;
            if Qx != Rx:
                f1 = f1/(Qx-Rx);
            else:
                flag=1;
    f1 = f1*(Qx-Rx);
    [f11,f12] = f1.polynomial().list();
    f1 = (f11 - f12 *a)/f1;
    f1 = ELS(f1,ceil((p+1)/r));
    if flag == 1:
        f1 = 1;
    return (f1);
    

# Compressed_pairing
def compressed_pairing(P,Q,string,r, A):
    (Px,Py,Pz)=P;
    (Qx,Qy,Qz)=Q;
    f1=G(1);
    Rx=Px;
    Ry=Py;

    l=len(string);
    flag=0;
    for i in range(1,l):
        lamb=(3*Rx^2+2*A*Rx+1)/(2*Ry);

        f1 = f1^2*(Qy-Ry-lamb*(Qx-Rx));

        Nx = lamb^2-2*Rx-A;
        Ny = lamb*(Rx-Nx)-Ry;

        Rx = Nx;
        Ry = Ny;
        if Qx != Rx:
            f1 = f1/(Qx-Rx);
        else:
            flag=1;
        if string[i] == '1' and i != l-1:
            if Rx != Px:
                lamb_1 =(Ry-Py)/(Rx-Px);
            else:
                lamb_1 = 1;
                flag = 1;
            f1 = f1*(Qy-Py-lamb_1*(Qx-Px));
            Nx = lamb_1^2-(Rx+Px)-A;
            Ny = lamb_1*(Px-Nx)-Py;
            Rx = Nx;
            Ry = Ny;
            if Qx != Rx:
                f1 = f1/(Qx-Rx);
            else:
                flag=1;
    f1 = f1*(Qx-Rx);
    [f11, f12] = f1.polynomial().list();
    f1 = (f11 - f12 * a)/f1;
    [f11, f12] = f1.polynomial().list();
    f1 = 2 * f11;
    f1 = Lucassequences(f1, ceil((p+1)/r));
    if flag == 1:
        f1 = 2;
    return (f1);

# Pairing computation of order N_A 
def pairing_NA(V):
#setup
	h = zero_vector(G,3);
	(x_V, y_V, z_V) = V;
	for k in range(3):
		h[0] = 1;
		h[1] = lam[0]*a*(x_V-QA[0])-(y_V-QA[1]);
		h[2] = h[1]*((QAm[3]-QAm[1])*a*(x_V-QA[0])-(QAm[2]-QAm[0])*(y_V-QA[1]));
	
	if string_NA[0] == "1":
		fNA = 1;
	if string_NA[0] == "2":
		fNA = lam[0]*a*(x_V-QA[0])-(y_V-QA[1]);
	if string_NA[0] == "3":
		fNA = lam[0]*a*(x_V-QA[0])-(y_V-QA[1]);
		fNA = fNA * ((QAm[3]-QAm[1])*a*(x_V-QA[0])-(QAm[2]-QAm[0])*(y_V-QA[1]));
		
	#loop
	for j in range(Len4_NA-1):		
		g_1 = a * t_1[j] * x_V;
		g_1 = g_1 - y_V;
		g_1 = g_1 + a * t_3[j];
		g = x_V + t_2[j];
		g = g * g_1; 
		g = g + a * t_4[j];
		g = g;
		fNA = fNA^2;
		fNA = fNA^2;
		fNA = fNA * g;
		if string_NA[j+1] == "1":
			fNA = fNA*(a*t_5[j]*(x_V-QAm[0])-(y_V-a*QAm[1]));
		if string_NA[j+1] == "2":
			fNA = fNA*h[1]*(a*t_5[j]*(x_V-QAm[2])-(y_V-a*QAm[3]));
		if string_NA[j+1] == "3":
			fNA = fNA*h[2]*(a*t_5[j]*(x_V-QAm[4])-(y_V-a*QAm[5]));

	#last iteration
	j = Len4_NA - 1;
	g_1 = a * t_1[j] * x_V;
	g_1 = g_1 - y_V;
	g_1 = g_1 + a * t_3[j];
	g = x_V + t_2[j];
	g = g * g_1; 
	g = g + a * t_4[j];
	g = g;
	fNA = fNA^2;
	fNA = fNA^2;
	fNA = fNA * g;
	if string_NA[j+1] == "1":
		fNA = fNA * (x_V - QAm[0]);
	if string_NA[j+1] == "2":
		fNA = fNA*h[1];
	if string_NA[j+1] == "3":
		fNA = fNA*h[2];
	[fNA1, fNA2] = fNA.polynomial().list();
	fNA = (fNA1 - fNA2 * a)/fNA;
	fNA = ELS(fNA, (p+1)/NA);
	return fNA;

# Pairing computation of order N_B (Algorithm 8)
def pairing_NB(V):
#setup
	h = zero_vector(G,3);
	(x_V, y_V, z_V) = V;
	for k in range(3):
		h[0] = 1;
		h[1] = lam[2]*a*(x_V-QB[0])-(y_V-QB[1]);
		h[2] = h[1]*((QBm[3]-QBm[1])*a*(x_V-QB[0])-(QBm[2]-QBm[0])*(y_V-QB[1]));
	
	if string_NB[0] == "1":
		fNB = 1;
	if string_NB[0] == "2":
		fNB = lam[2]*a*(x_V-QB[0])-(y_V-QB[1]);
	if string_NB[0] == "3":
		fNB = lam[2]*a*(x_V-QB[0])-(y_V-QB[1]);
		fNB = fNB * ((QBm[3]-QBm[1])*a*(x_V-QB[0])-(QBm[2]-QBm[0])*(y_V-QB[1]));
		
	#loop
	for j in range(Len4_NB-1):		
		g_1 = a * t_6[j] * x_V;
		g_1 = g_1 - y_V;
		g_1 = g_1 + a * t_8[j];
		g = x_V + t_7[j];
		g = g * g_1; 
		g = g + a * t_9[j];
		g = g;
		fNB = fNB^2;
		fNB = fNB^2;
		fNB = fNB * g;
		if string_NB[j+1] == "1":
			fNB = fNB*(a*t_10[j]*(x_V-QBm[0])-(y_V-a*QBm[1]));
		if string_NB[j+1] == "2":
			fNB = fNB*h[1]*(a*t_10[j]*(x_V-QBm[2])-(y_V-a*QBm[3]));
		if string_NB[j+1] == "3":
			fNB = fNB*h[2]*(a*t_10[j]*(x_V-QBm[4])-(y_V-a*QBm[5]));

	#last iteration
	j = Len4_NB - 1;
	g_1 = a * t_6[j] * x_V;
	g_1 = g_1 - y_V;
	g_1 = g_1 + a * t_8[j];
	g = x_V + t_7[j];
	g = g * g_1; 
	g = g + a * t_9[j];
	g = g;
	fNB = fNB^2;
	fNB = fNB^2;
	fNB = fNB * g;
	if string_NB[j+1] == "1":
		fNB = fNB * (x_V - QBm[0]);
	if string_NB[j+1] == "2":
		fNB = fNB*h[1];
	if string_NB[j+1] == "3":
		fNB = fNB*h[2];
	[fNB1, fNB2] = fNB.polynomial().list();
	fNB = (fNB1 - fNB2 * a)/fNB;
	fNB = ELS(fNB, (p+1)/NB);
	return fNB;

# Chinese Remainder Theorem
def chinese_remainder(s, L):
	if len(s) == 0:
		return 1;
	while len(s) > 1:
		label = 0;
		if mod(len(s),2) == 1:
			tmps = s[len(s)-1];
			tmpL = L[len(s)-1];
			label = 1;
		s = [crt(s[i*2], s[i*2 + 1], L[i*2], L[i*2 + 1]) for i in range(floor(len(s)/2))]; 
		L = [prod(L[i*2 : (i + 1)*2])  for i in range(floor(len(L)/2))];
		if label == 1:
			s.append(tmps);
			L.append(tmpL);
	return s[0];
  
# Discrete logarithm computation (Algorithm 9)
def DLC(ind, hh1, hh2, hh3, hh4, label, Primes):
  H_base = []; H1 = []; H2 = []; H3 = [];
  n = len(Primes);
  if label == 0:
    H_base = hh1; H1 = hh2; H2 = hh3; H3 = hh4;
  if label == 1:
    H_base = hh2; H1 = hh1; H2 = hh3; H3 = hh4;
  if label == 2:
    H_base = hh3; H1 = hh1; H2 = hh2; H3 = hh4;
  if label == 3:
    H_base = hh4; H1 = hh1; H2 = hh2; H3 = hh3;
  ans = zero_vector(3*n);
  hh = [];
  for i in range(3*n):
    hh.append(G(0));
  for i in range(n):
    hh[i] = H1[n-1-i]; 
    hh[n+i] = H2[n-1-i];
    hh[2*n+i] = H3[n-1-i];
  for i in range(n):
    tmp = H_base[n-1-i];
    hhtmp = zero_vector(6);
    label3 = [0,0,0];
    for j in range(3):
      if hh[i+j*n] == 1:
        label3[j] = 1;
      else:
        [hhtmp[2*j], hhtmp[2*j+1]] = hh[i+j*n].polynomial().list();
        hhtmp[2*j] = 2 * hhtmp[2*j];
    [tmp1,tmp2] = H_base[n-1-i].polynomial().list();
    tmp0 = 2 * tmp1; v0 = 2; v1 = tmp0; tmp3 = tmp0^2 - G(4);
    j = 0; v2 = v1^2 - 2;
    while label3 != [1,1,1]:
      for k in range(3):
        if hhtmp[2*k] == v1:
          label3[k] = 1;
          if j != 0:	
            if hhtmp[2*k+1] * tmp3 == tmp2 * (v2 - v0):
              ans[k*n+i] = j+1; label3[k] = 1;
            else:
              ans[k*n+i] = -j-1; label3[k] = 1; 
          else:
            if hhtmp[2*k+1] == tmp2:
              ans[k*n+i] = 1; label3[k] = 1;
            else:
              ans[k*n+i] = -1; label3[k] = 1;
      j = j + 1; 
      tmp = v2;
      v2 = tmp * tmp0 - v1;
      v0 = v1;
      v1 = tmp;
  S = zero_vector(3);
  S[0] = chinese_remainder(ans[0:n], Primes);
  S[1] = chinese_remainder(ans[n:2*n], Primes);
  S[2] = chinese_remainder(ans[2*n:3*n], Primes);
  return S;

s = []

for i in range(1,len(prime_A)):
    s.append(i);

ind = [];

for i in range(len(prime_A)):
    ind.append(i);
   
s.reverse();

Apush = G(6);

XPre_A = [];

XPre_B = [];

APre= [];

BPre = [];

random.seed(int(0));
skA = random.randint(1, NA - 1);
random.seed(int(0));
skB = random.randint(1, NB - 1);

XPushA = [[xPB, G(1)], [xQB, G(1)], [xR_B, G(1)], [xQA, G(1)]];

[A1, XPushA, XPre_A, APre] = msidh_action_Alice(Apush, XPushA, skA, degree_bound, QA[0], PA[0], QA[1], PA[1], XPre_A, APre);

T3 = time.time();

print("Alice's isogeny construction:", T3-T2);

XPushB = [[xPA, G(1)], [xQA, G(1)], [xR_A, G(1)], [xQB, G(1)]];

[B1, XPushB, XPre_B, BPre] = msidh_action_Bob(Apush, XPushB, skB, degree_bound, QB[0], PB[0], QB[1], PB[1], XPre_B, BPre);

T4 = time.time();

print("Bob's isogeny construction:", T4-T3);

EA = EllipticCurve(G,[0,A1,0,1,0]);

EB = EllipticCurve(G,[0,B1,0,1,0]);

prime_A.reverse();

prime_B.reverse();

XPre_A.reverse();

XPre_B.reverse();

APre.reverse();

BPre.reverse();

labelA = 4; i0 = 0;

while(labelA == 4):

  UAi=[];
  random.seed(int(2022 + i0));
  UA=generate_U(UAi,B1,ind, EB, prime_A, NB);
  random.seed(int(2023 + i0));
  VA=generate_V(B1,ind,UA,UAi, EB, prime_A, NA);
  VA = 4*NB*VA;
  UAmVA = UA - VA;
  
  T5 = time.time();

  print("Bob's torsion basis generation:", T5-T4);
  
  XPush_A = [[UA[0], UA[2]],  [VA[0], VA[2]], [UAmVA[0], UAmVA[2]]];
  
  [Aimage, XPush_A] = msidh_action_Bob_dual(B1, XPush_A, degree_bound, XPre_B, BPre);

  [XimageA1, ZimageA1] = dual_iso_from_6_to_0(XPush_A[0][0], XPush_A[0][1])

  [XimageA2, ZimageA2] = dual_iso_from_6_to_0(XPush_A[1][0], XPush_A[1][1])

  [XimageA3, ZimageA3] = dual_iso_from_6_to_0(XPush_A[2][0], XPush_A[2][1])

  ximageA = XimageA1/ZimageA1;

  UA0 = E0([ximageA,sqrFp2(ximageA^3 + ximageA)]);

  ximageA = XimageA2/ZimageA2;

  VA0 = E0([ximageA,sqrFp2(ximageA^3 + ximageA)]);

  if (UA0[0] + VA0[0] + XimageA3/ZimageA3) * (UA0[0] - VA0[0])^2 == (UA0[1] - VA0[1])^2:
    VA0 = - VA0; 
    

  [tmp1, tmp2] = UA0[0].polynomial().list();
  [tmp3, tmp4] = UA0[1].polynomial().list();
  UA0p = E0([tmp1 - tmp2 * a, tmp3 - tmp4 *a]);
  UA0psi = E0([-tmp1 - tmp2 * a, - tmp4 + tmp3 * a]);
  UA0ppsi = E0([-tmp1 + tmp2 * a, - tmp4 - tmp3 * a]);
  UA0t = UA0 + UA0p;
  UA0tpsi = UA0psi + UA0ppsi;

  [tmp1, tmp2] = VA0[0].polynomial().list();
  [tmp3, tmp4] = VA0[1].polynomial().list();
  VA0p = E0([tmp1 - tmp2 * a, tmp3 - tmp4 *a]);
  VA0psi = E0([-tmp1 - tmp2 * a, - tmp4 + tmp3 * a]);
  VA0ppsi = E0([-tmp1 + tmp2 * a, - tmp4 - tmp3 * a]);
  VA0t = VA0 + VA0p;
  VA0tpsi = VA0psi + VA0ppsi;
  
  T6 = time.time();

  print("Bob's dual isogeny computation", T6-T5);
  
  h0 = pairing_NA(PA);
  h1 = pairing_NA(UA0t);
  h2 = pairing_NA(VA0t);
  h3 = pairing_NA(UA0tpsi);
  h4 = pairing_NA(VA0tpsi);
  
  T7 = time.time();
  
  print("Bob's pairing computation:", T7-T6);
  
  hh1 = [];
  hh2 = [];
  hh3 = [];
  hh4 = [];
  h = [h1, h2, h3, h4];
  batch_cof(hh1,h[0],ind,len(ind), prime_A);
  batch_cof(hh2,h[1],ind,len(ind), prime_A);
  batch_cof(hh3,h[2],ind,len(ind), prime_A);
  batch_cof(hh4,h[3],ind,len(ind), prime_A);
  labelA4 = [0,0,0,0];
  
  for i in range(len(ind)):
      if hh4[i] == 1:
        labelA4[3] = 1; 
  for i in range(len(ind)):
      if hh3[i] == 1:
        labelA4[2] = 1;
  for i in range(len(ind)):
      if hh2[i] == 1:
        labelA4[1] = 1;
  for i in range(len(ind)):
      if hh1[i] == 1:
        labelA4[0] = 1;
  for i in range(4):
      if labelA4[i] == 0:
        labelA = i; 
  if labelA != 4:
    SA = DLC(ind, hh1, hh2, hh3, hh4, labelA, prime_A);
  else:
    i0 = i0 + 1;
  T8 = time.time();
  print("Bob's discrete logarithm computation", T8-T7);
 
labelB = 4; j0 = 0;

while(labelB == 4):
  UBi=[];
  random.seed(int(2022 + j0));
  UB=generate_U(UBi,A1,ind, EA, prime_B, NA);
  random.seed(int(2023 + j0));
  VB=generate_V(A1,ind,UB,UBi, EA, prime_B, NB);
  VB=4*NA*VB;
  UBmVB = UB - VB;
  
  XPush_B = [[UB[0], UB[2]],  [VB[0], VB[2]], [UBmVB[0], UBmVB[2]]];

  T9 = time.time();

  print("Alice's torsion basis generation:", T9-T8);

  [Bimage, XPush_B] = msidh_action_Alice_dual(A1, XPush_B, degree_bound, XPre_A, APre);

  [XimageB1, ZimageB1] = dual_iso_from_6_to_0(XPush_B[0][0], XPush_B[0][1])

  [XimageB2, ZimageB2] = dual_iso_from_6_to_0(XPush_B[1][0], XPush_B[1][1])

  [XimageB3, ZimageB3] = dual_iso_from_6_to_0(XPush_B[2][0], XPush_B[2][1])
  
  ximageB = XimageB1/ZimageB1;

  UB0 = E0([ximageB,sqrFp2(ximageB^3 + ximageB)]);

  ximageB = XimageB2/ZimageB2;

  VB0 = E0([ximageB,sqrFp2(ximageB^3 + ximageB)]);

  if (UB0[0] + VB0[0] + XimageB3/ZimageB3) * (UB0[0] - VB0[0])^2 == (UB0[1] - VB0[1])^2:
    VB0 = - VB0; 
	
  [tmp1, tmp2] = UB0[0].polynomial().list();
  [tmp3, tmp4] = UB0[1].polynomial().list();
  UB0p = E0([tmp1 - tmp2 * a, tmp3 - tmp4 *a]);
  UB0psi = E0([-tmp1 - tmp2 * a, - tmp4 + tmp3 * a]);
  UB0ppsi = E0([-tmp1 + tmp2 * a, - tmp4 - tmp3 * a]);
  UB0t = UB0 + UB0p;
  UB0tpsi = UB0psi + UB0ppsi;

  [tmp1, tmp2] = VB0[0].polynomial().list();
  [tmp3, tmp4] = VB0[1].polynomial().list();
  VB0p = E0([tmp1 - tmp2 * a, tmp3 - tmp4 *a]);
  VB0psi = E0([-tmp1 - tmp2 * a, - tmp4 + tmp3 * a]);
  VB0ppsi = E0([-tmp1 + tmp2 * a, - tmp4 - tmp3 * a]);
  VB0t = VB0 + VB0p;
  VB0tpsi = VB0psi + VB0ppsi;

  T10 = time.time();

  print("Alice's dual isogeny computation", T10-T9);
  
  h5 = pairing_NB(UB0t);
  h6 = pairing_NB(VB0t);
  h7 = pairing_NB(UB0tpsi);
  h8 = pairing_NB(VB0tpsi);

  T11 = time.time();
  print("Alice's pairing computation:", T11-T10);

  hh5 = [];
  hh6 = [];
  hh7 = [];
  hh8 = [];
  h = [h5, h6, h7, h8];
  batch_cof(hh5,h[0],ind,len(ind),prime_B);
  batch_cof(hh6,h[1],ind,len(ind), prime_B);
  batch_cof(hh7,h[2],ind,len(ind), prime_B);
  batch_cof(hh8,h[3],ind,len(ind), prime_B);
  labelB4 = [0,0,0,0];

  for i in range(len(ind)):
	  if hh8[i] == 1:
		  labelB4[3] = 1; 

  for i in range(len(ind)):
	  if hh7[i] == 1:
		  labelB4[2] = 1; 

  for i in range(len(ind)):
	  if hh6[i] == 1:
		  labelB4[1] = 1; 


  for i in range(len(ind)):
	  if hh5[i] == 1:
		  labelB4[0] = 1; 

  for i in range(4):
      if labelB4[i] == 0:
        labelB = i;
  
  if labelB != 4:
    SB = DLC(ind, hh5, hh6, hh7, hh8, labelB, prime_B);     
  else:
    j0 = j0 + 1;

T12 = time.time();
print("Alice's discrete logarithm computation", T12-T11);

# Alice generates the same torsion basis with Bob.
 
UAi=[];
random.seed(int(2022 + i0));
UA=generate_U(UAi,B1,ind, EB, prime_A, NB);
random.seed(int(2023 + i0));
VA=generate_V(B1,ind,UA,UAi, EB, prime_A, NA);
VA = 4*NB*VA;

if labelA == 0:
  AB = msidh_action_Alice_last(B1, skA, degree_bound, UA, VA, -SA[2], -SA[0], SA[1], 1);
  
elif labelA == 1:
  AB = msidh_action_Alice_last(B1, skA, degree_bound, UA, VA, SA[2], 1, -SA[1], -SA[0]);
  
elif labelA == 2:
  AB = msidh_action_Alice_last(B1, skA, degree_bound, UA, VA, -SA[2], -SA[1], 1, SA[0]);

else:
  AB = msidh_action_Alice_last(B1, skA, degree_bound, UA, VA, 1, SA[1], -SA[2], -SA[0]);

T13 = time.time();

print("Alice's Key agreement", T13 - T12);

# Bob generates the same torsion basis with Alice.

UBi=[];
random.seed(int(2022 + j0));
UB=generate_U(UBi,A1,ind, EA, prime_B, NA);
random.seed(int(2023 + j0));
VB=generate_V(A1,ind,UB,UBi, EA, prime_B, NB);
VB=4*NA*VB;

if labelB == 0:
  BA = msidh_action_Bob_last(A1, skB, degree_bound, UB, VB, -SB[2], -SB[0], SB[1], 1);
  
elif labelB == 1:
  BA = msidh_action_Bob_last(A1, skB, degree_bound, UB, VB, SB[2], 1, -SB[1], -SB[0]);
  
elif labelB == 2:
  BA = msidh_action_Bob_last(A1, skB, degree_bound, UB, VB, -SB[2], -SB[1], 1, SB[0]);

else:
  BA = msidh_action_Bob_last(A1, skB, degree_bound, UB, VB, 1, SB[1], -SB[2], -SB[0]);
 
T14 = time.time();

print("Bob's Key agreement", T14 - T13);

if J(AB) == J(BA):
  print("The key exchange is successful.");
else:
  print("The key exchange is unsuccessful.");
