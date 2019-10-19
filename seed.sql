\c d3luk71mvo4o5h;
-- </init>
--
-- Table structure for table "users"
--

CREATE TABLE "user" (
    "id" SERIAL,
    "name" VARCHAR(40) NOT NULL,
    "username" VARCHAR(40) NOT NULL,
    "email" VARCHAR(40),
    "phone_number" VARCHAR(40),
    "password" TEXT NOT NULL,
    "type" SMALLINT NOT NULL DEFAULT 2,
    "gender" BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (id)
);

--
-- Dumping data for table "users"
--

INSERT INTO "user" ("name", "username", "password", "type")
        VALUES ('Mohammed Alobaidi', 'mohalobaidi', 'HO5G7VT6BfPPBKop6EXSA+g+Xe/7GJ6EFVfkLdlILdo=', 0), -- qwertyqwerty
        ('Hadi Albinsaad', 'hadi', 'fntZQTUb/h4j43/7BmWhBBpoLs0sgYkFTMyUsW06Ic0=', 0), -- hadi
        ('Admin', 'admin', 'fntZQTUb/h4j43/7BmWhBBpoLs0sgYkFTMyUsW06Ic0=', 0), -- hadi
        ('Sami Zhioua', 'sami', 'KsQaGUwkDmIvE0E8IHNyEWGbuRM59mwlrsFi4zJEDBw=', 0), -- zhioua
        ('Active Player', 'active', 'X+zrZv/IbzjZUnhsbWlsecLbwjndTpG0ZynXOif7V+k=', 1), -- 0
        ('No Active Player', 'noactive', 'X+zrZv/IbzjZUnhsbWlsecLbwjndTpG0ZynXOif7V+k=', 2) -- 0
;
--
-- Table structure for table "challenge"
--

CREATE TABLE "challenge" (
    "id" SERIAL,
    "name" VARCHAR(20) NOT NULL,
    "description" TEXT NOT NULL,
    "method_name" VARCHAR(40) NOT NULL,
    "method_type" VARCHAR(20) NOT NULL,
    "parameters" TEXT NOT NULL,
    "tests" TEXT NOT NULL,
    "points" INTEGER NOT NULL DEFAULT 10,
    "type" SMALLINT NOT NULL DEFAULT 1, -- 0=ONLY ADMIN, -- 1=ACTIVE, 2=INACTIVE(TUTORIAL)
    PRIMARY KEY (id)
);

--
-- Dumping data for table "challenges"
--

COPY public.challenge (name, description, method_name, method_type, parameters, tests, points, type) FROM stdin;
Adding Two Numbers	Given 2 numbers, a and b, return their sum.\n\nsum(1, 2) should return 3\nsum(3, -4) should return -1\nsum(6, 0) should return 6	sum	Integer	[{"name":"a","type":"Integer"},{"name":"b","type":"Integer"}]	{"inputs":[["2","6","0","-2","34","0",""],["1","-1","3","2","-33","0"]],"outputs":["3","5","3","0","1","0"]}	6	2
Remove Character	Given a non-empty string and an int n, return a new string where the char at index n has been removed. Assume that n is a valid index (n is in the range 0..str.length()-1 inclusive). \n\nremoveChar("kfupm", 1) should return "kupm"\nremoveChar("kfupm", 0) should return "fupm"\nremoveChar("kfupm", 4) should return "kfup"	removeChar	String	[{"name":"text","type":"String"},{"name":"n","type":"Integer"}]	{"inputs":[["\\"kfupm\\"\\r","\\"kfupm\\"\\r","\\"kfupm\\"\\r","\\"Hi\\"\\r","\\"Hi\\"\\r","\\"ccse\\"\\r","\\"ccse\\"\\r","\\"ccse\\"\\r","\\"ccse\\"\\r","\\"chocolate\\""],["1\\r","0\\r","4\\r","0\\r","1\\r","0\\r","1\\r","2\\r","3\\r","8"]],"outputs":["\\"kupm\\"\\r","\\"fupm\\"\\r","\\"kfup\\"\\r","\\"i\\"\\r","\\"H\\"\\r","\\"cse\\"\\r","\\"cse\\"\\r","\\"cce\\"\\r","\\"ccs\\"\\r","\\"chocolat\\""]}	10	3
Count Characters	Given a non-empty string and a character c, count and return the number of times the character c is repeated in the string.\n\n\ncountChar("kfupm", 'p') should return 1\ncountChar("ccse", 'c') should return 2\ncountChar("ics", 'k') should return 0	countChar	Integer	[{"name":"text","type":"String"},{"name":"c","type":"Char"}]	{"inputs":[["\\"kfupm\\"\\r","\\"ccse\\"\\r","\\"ics\\"\\r","\\"hackathon\\"\\r","\\"\\"\\r","\\" \\"\\r","\\"xxxxx\\"\\r","\\"khobarkhobar\\"\\r","\\"i2\\"\\r","\\"    \\""],["'f'\\r","'c'\\r","'k'\\r","'h'\\r","'x'\\r","' '\\r","'x'\\r","'k'\\r","'2'\\r","'a'"]],"outputs":["1\\r","2\\r","0\\r","2\\r","0\\r","1\\r","5\\r","2\\r","1\\r","0"]}	10	3
Rotating Strings	Given a string s and an integer k, rotate s for k positions to the right.\nAssume that k value is valid.\n\nrotateString("TechBench", 5) should return "BenchTech" \nrotateString("kfupm", 1) should return "mkfup"\nrotateString("ics", 0) should return "ics"	rotateString	Integer	[{"name":"text","type":"String"},{"name":"i","type":"Integer"}]	{"inputs":[["\\"SaharaNet\\"\\r","\\"KFUPM\\"\\r","\\"ICS\\"\\r","\\"TechBench\\"\\r","\\"Challenge\\"\\r","\\"Java\\"\\r","\\"C\\"\\r","\\"King Fahad University\\"\\r","\\"Program\\"\\r","\\"C++\\""],["3\\r","1\\r","0\\r","5\\r","6\\r","2\\r","1\\r","5\\r","3\\r","1"]],"outputs":["\\"NetSahara\\"\\r","\\"MKFUP\\"\\r","\\"ICS\\"\\r","\\"BenchTech\\"\\r","\\"llengeCha\\"\\r","\\"vaJa\\"\\r","\\"C\\"\\r","\\"rsityKing Fahad Unive\\"\\r","\\"ramProg\\"\\r","\\"+C+\\""]}	10	3
Equalize And Concat	Given two strings, append them together (known as "concatenation") and return the result. However, if the strings are different lengths, omit chars from the longer string so it is the same length as the shorter string. Omission is done from the front of the string. So "Hello" and "Hi" yield "loHi". The strings may be any length. \n\n\nEqualizeAndConcat("Hello", "Hi") should return "loHi"\nEqualizeAndConcat("Hello", "java") should return "ellojava"\nEqualizeAndConcat("java", "Hello") should return "javaello"	equalizeAndConcat	String	[{"name":"a","type":"String"},{"name":"b","type":"String"}]	{"inputs":[["\\"Hello\\"\\r","\\"Hello\\"\\r","\\"java\\"\\r","\\"abc\\"\\r","\\"x\\"\\r","\\"abc\\"\\r","\\"st1\\"\\r","\\"strr\\"\\r","\\"ssss\\"\\r","\\"aa\\""],["\\"Hi\\"\\r","\\"java\\"\\r","\\"Hello\\"\\r","\\"x\\"\\r","\\"abc\\"\\r","\\"\\"\\r","\\"st2\\"\\r","\\"strr\\"\\r","\\"xxxx\\"\\r","\\"ccc\\""]],"outputs":["\\"loHi\\"\\r","\\"ellojava\\"\\r","\\"javaello\\"\\r","\\"cx\\"\\r","\\"xc\\"\\r","\\"\\"\\r","\\"st1st2\\"\\r","\\"strrstrr\\"\\r","\\"ssssxxxx\\"\\r","\\"aacc\\""]}	10	3
Sum Same Digits	Given 2 non-negative ints, a and b, return their sum, so long as the sum has the same number of digits as a. If the sum has more digits than a, just return a without b.  \n\n\nsumSameDigits(2, 3) should return 5\nsumSameDigits(8, 3) should return 8\nsumSameDigits(8, 1) should return 9\n	sumSameDigits	Integer	[{"name":"a","type":"Integer"},{"name":"b","type":"Integer"}]	{"inputs":[["11\\r","11\\r","0\\r","99\\r","99\\r","123\\r","1\\r","23\\r","23\\r","9000"],["39\\r","99\\r","0\\r","0\\r","1\\r","1\\r","123\\r","60\\r","80\\r","1"]],"outputs":["50\\r","11\\r","0\\r","99\\r","99\\r","124\\r","1\\r","83\\r","23\\r","9001"]}	10	3
Get Sandwich	A sandwich is two pieces of bread with something in between. Return the string that is between the first and last appearance of "bread" in the given string, or return the empty string "" if there are not two pieces of bread. \ngetSandwich("breadjambread") should return "jam"\ngetSandwich("xxbreadjambreadyy") should return "jam"\ngetSandwich("xxbreadyy") should return ""\n	getSandwich	String	[{"name":"text","type":"String"}]	{"inputs":[["\\"breadjambread\\"\\r","\\"xxbreadjambreadyy\\"\\r","\\"xxbreadyy\\"\\r","\\"xxbreadbreadjambreadyy\\"\\r","\\"breadAbread\\"\\r","\\"breadbread\\"\\r","\\"abcbreaz\\"\\r","\\"xyz\\"\\r","\\"\\"\\r","\\"breadbreadbreadbread\\""]],"outputs":["\\"jam\\"\\r","\\"jam\\"\\r","\\"\\"\\r","\\"breadjam\\"\\r","\\"A\\"\\r","\\"\\"\\r","\\"\\"\\r","\\"\\"\\r","\\"\\"\\r","\\"breadbread\\""]}	10	3
Replace Plus	Given a string and a non-empty word string, return a version of the original String where all chars have been replaced by pluses ("+"), except for appearances of the word string which are preserved unchanged.\n\nreplacePlus("12xy34", "xy") should return "++xy++"\nreplacePlus("12xy34", "1") should return "1+++++"\nreplacePlus("12xy34xyabcxy", "xy") should return "++xy++xy+++xy"	replacePlus	String	[{"name":"text","type":"String"},{"name":"word","type":"String"}]	{"inputs":[["\\"SaharaNet\\"\\r","\\"KFUPM\\"\\r","\\"ICS\\"\\r","\\"TechBench\\"\\r","\\"Challenge\\"\\r","\\"Java\\"\\r","\\"C\\"\\r","\\"King Fahad University\\"\\r","\\"Program\\"\\r","\\"C++\\""],["\\"ara\\"\\r","\\"U\\"\\r","\\"ICS\\"\\r","\\"e\\"\\r","\\"l\\"\\r","\\"a\\"\\r","\\"c\\"\\r","\\"x\\"\\r","\\"ram\\"\\r","\\"C\\""]],"outputs":["\\"+++ara+++\\"\\r","\\"++U++\\"\\r","\\"ICS\\"\\r","\\"+e+++e+++\\"\\r","\\"+++ll++++\\"\\r","\\"+a+a\\"\\r","\\"+\\"\\r","\\"+++++++++++++++++++++\\"\\r","\\"++++ram\\"\\r","\\"C++\\""]}	10	3
Fill Multiple Of Ten	For each multiple of 10 in the given array, change all the values following it to be that multiple of 10, until encountering another multiple of 10. So [2, 10, 3, 4, 20, 5] yields [2, 10, 10, 10, 20, 20]. \n\n\nfillMultipleTen([2, 10, 3, 4, 20, 5]) should return [2, 10, 10, 10, 20, 20]\nfillMultipleTen([10, 1, 20, 2]) should return [10, 10, 20, 20]\nfillMultipleTen([10, 1, 9, 20]) should return [10, 10, 10, 20]	fillMultipleTen	Integer Array	[{"name":"nums","type":"Integer Array"}]	{"inputs":[["[2, 10, 3, 4, 20, 5]\\r","[10, 1, 20, 2]\\r","[10, 1, 9, 20]\\r","[1, 2, 50, 1]\\r","[1, 20, 50, 1]\\r","[10, 10]\\r","[10, 2]\\r","[0, 2]\\r","[1]\\r","[]\\r","[10, 10]\\r","[10, 2]\\r","[0, 2]\\r","[1]\\r","[]"]],"outputs":["[2, 10, 10, 10, 20, 20]\\r","[10, 10, 20, 20]\\r","[10, 10, 10, 20]\\r","[1, 2, 50, 50]\\r","[1, 20, 50, 50]\\r","[10, 10]\\r","[10, 10]\\r","[0, 0]\\r","[1]\\r","[]\\r","[10, 10]\\r","[10, 10]\\r","[0, 0]\\r","[1]\\r","[]"]}	15	3
Magic numbers	Given an array of integers a, count the number of magic numbers in the array. A magic number is a number which is equal to half the sum of the previous values in the array.\n\n\ncountMagicNumbers([2,1,5,4]) should return 2\n(1 is magic, 4 is magic since it is equal to half (2+1+5))\n\ncountMagicNumbers([5,1,6,6,2]) should return 1\n(the second 6 is magic)\n\ncountMagicNumbers([7,3,2]) should return 0	countMagicNumbers	Integer	[{"name":"arr","type":"Integer Array"}]	{"inputs":[["[2,1,5,4]\\r","[5,1,6,6,2]\\r","[7,3,2]\\r","[]\\r","[1,3,2,3,5,7,1,11]\\r","[2,1]\\r","[4,2,2,3]\\r","[8,8,8,8,16]\\r","[5,5,5,5]\\r","[3]\\r","[2,1,5,4]\\r","[5,1,6,6,2]\\r","[7,3,2]\\r","[]\\r","[1,3,2,3,5,7,1,11]"]],"outputs":["2\\r","1\\r","0\\r","0\\r","4\\r","1\\r","1\\r","2\\r","1\\r","0\\r","2\\r","1\\r","0\\r","0\\r","4"]}	15	3
Two Sum	Given an array of integers a and a target value, return the indices of two numbers inside the array such that they add up to the target value. The two indices should be returned in an array of size 2.\n\nYou may assume that each input would have exactly one solution.\n\nTwoSum([2, 7, 11, 15], 9) should return [0, 1]\n(because a[0] + a[1] = 9)\nTwoSum([8, 10, 11, 1, 4], 15) --> [2, 4]\n(because a[2] + a[4] = 15)\n\nTwoSum([2, 7, 11, 15], 9) --> [0, 1]\n(because a[0] + a[1] = 9)	twoSum	Integer Array	[{"name":"a","type":"Integer Array"},{"name":"target","type":"Integer"}]	{"inputs":[["[0,4,3,0]\\r","[3,2,4]\\r","[-3,4,3,90]\\r","[-1,-2,-3,-4,-5]\\r","[5,75,25]\\r","[150,24,79,50,88,345,3]\\r","[2,1,9,4,4,56,90,3]\\r","[15, 5, -1, -2, 4, -3, 11]\\r","[591,955,829,805,312,83,764,841,12,744,104,773,627,306,731,539,349,811,662,341,465,300,491,423,569,405,508,802,500,747,689,506,129,325,918,606,918,370,623,905,321,670,879,607,140,543,997,530,356,446,444,184,787,199,614,685,778,929,819,612,737,344,471,645,726]\\r","[12, 4, -10, 40, 52, 3, 24]\\r","[-1, -2, 0, 2, 3]\\r","[4, 3, 5, 10, -2, -7, -4, -5]\\r","[12, 11, 4, 0, 2, -11, 3]\\r","[1, 3, 6, -2, 2, 5]\\r","[1519, 1]"],["0\\r","6\\r","0\\r","-8\\r","100\\r","200\\r","8\\r","12\\r","789\\r","42\\r","1\\r","-3\\r","11\\r","5\\r","1520"]],"outputs":["[0, 3]\\r","[1,2]\\r","[0, 2]\\r","[2, 4]\\r","[1,2]\\r","[0,3]\\r","[3, 4]\\r","[0, 5]\\r","[10, 55]\\r","[2, 4]\\r","[0, 3]\\r","[0, 5]\\r","[1, 3]\\r","[1,4]\\r","[0, 1]"]}	15	3
Closest Sum	Given an array S of n integers and an integer value target, find three integers in S such that the sum is closest to  target. Return the sum of the three integers. You may assume that each input would have exactly one solution.\n\nCloseSum([-1, 2, 1, -4], 1) should return 2\n(because -1 + 2 + 1 = 2 which is the closest to 1)\nCloseSum([2, 7, 11, 15], 19) should return 20\n(because 2 + 7 + 11 = 20 which is the closest to 19) \n\nCloseSum([3, 4, 4, 5], 6) should return 11\n(because 3 + 4 + 4 = 11 which is the closest to 6) 	closeSum	Integer	[{"name":"nums","type":"Integer Array"},{"name":"target","type":"Integer"}]	{"inputs":[["[4, 5, 3, 4]\\r","[1, 9, 3, 4, 2, 0]\\r","[3, 4, 5, -1, 2, -3]\\r","[3, 4, 5, 5, 3, 11, 1, 1]\\r","[-1, -4, 10, 1, 14, -5]\\r","[0,0,0]\\r","[0, 1, 2]\\r","[1,1,-1]\\r","[1,1,1,1]\\r","[1,1,1,0]\\r","[-10,-3,10,4,5,2]\\r","[1, -1, -1, 0]\\r","[1, 5, 3, 2, 8, 4]\\r","[10, 90, 100, 70, 50, 30]\\r","[12,12,-2,12,9,4,5,-4]"],["6\\r","2\\r","-3\\r","14\\r","0\\r","1\\r","3\\r","0\\r","0\\r","-100\\r","13\\r","-3\\r","-8\\r","100\\r","-9"]],"outputs":["11\\r","3\\r","-2\\r","14\\r","1\\r","0\\r","3\\r","1\\r","3\\r","2\\r","12\\r","-2\\r","6\\r","90\\r","-2"]}	15	3
Longest Chain Round	Given a string, return the length of the largest "chain" in the string. A chain is a run of adjacent chars that are the same. Important: at the end of the string, the chain may continue from the beginning of the string and it is considered as a single chain: see example 2 below.\n\n\nlongestChainRound("hoopla") should return 2  (the longest chain is "oo")\nlongestChainRound("aabbCCCddBBBaaa") should return 5 (the longest chain is "aaaaa")\nlongestChainRound("") should return 0	longestChainRound	Integer	[{"name":"text","type":"String"}]	{"inputs":[["\\"hoopla\\"\\r","\\"abbCCCddBBBxx\\"\\r","\\"\\"\\r","\\"xyz\\"\\r","\\"xxyz\\"\\r","\\"xyzz\\"\\r","\\"abbbcbbbxbbbx\\"\\r","\\"XXBBBbbxx\\"\\r","\\"XXBBBBbbxx\\"\\r","\\"XXBBBbbxxXXXX\\"\\r","\\"ahoopla\\"\\r","\\"aabbCCCddBBBaaa\\"\\r","\\"\\"\\r","\\"xxx\\"\\r","\\"xxyzx\\"\\r","\\"xyzz\\"\\r","\\"abbbcbbbxbbbx\\"\\r","\\"XXBBBbbxx\\"\\r","\\"XXBBBBbbxx\\"\\r","\\"bbbbbbbbb\\""]],"outputs":["2\\r","3\\r","0\\r","1\\r","2\\r","2\\r","3\\r","3\\r","4\\r","6\\r","2\\r","5\\r","0\\r","3\\r","3\\r","2\\r","3\\r","3\\r","4\\r","9"]}	20	3
Four Repeated	Given an array of ints, return true if the array contains two 4's next to each other, or there are two 4's separated by one element, such as with [4, 1, 4].\n\n\nFourRepeated([1, 4, 4]) --> true\nFourRepeated([1, 4, 1, 4]) --> true\nFourRepeated([1, 4, 1, 1, 4]) --> false	FourRepeated	Boolean	[{"name":"nums","type":"Integer Array"}]	{"inputs":[["[1, 4, 1, 4]\\r","[1, 4, 1, 1, 4]\\r","[4, 4, 1, 1, 4]\\r","[2, 4, 2, 2, 4, 2]\\r","[2, 4, 2, 2, 4, 4]\\r","[4, 2, 4, 2, 2, 4]\\r","[4, 2, 6, 2, 2, 4]\\r","[4, 4, 4]\\r","[1, 2]\\r","[4]\\r","[1, 4, 1, 4]\\r","[1, 4, 1, 1, 4]\\r","[4, 4, 1, 1, 4]\\r","[2, 4, 2, 2, 4, 2]\\r","[2, 4, 2, 2, 4, 4]\\r","[4, 2, 4, 2, 2, 4]\\r","[4, 2, 6, 2, 2, 4]\\r","[4, 4, 4]\\r","[1, 2]\\r","[4]"]],"outputs":["true\\r","false\\r","true\\r","false\\r","true\\r","true\\r","false\\r","true\\r","false\\r","false\\r","true\\r","false\\r","true\\r","false\\r","true\\r","true\\r","false\\r","true\\r","false\\r","false"]}	20	3
Find The Length	Given a string, find the length of the longest substring without repeating characters.\n\nlenMaxSeq("abcabcbb") should return 3\nlenMaxSeq("bbbbb") should return 1\nlenMaxSeq("pwwkew") should return 3	lenMaxSeq	Integer	[{"name":"text","type":"String"}]	{"inputs":[["\\"SaharaNet\\"\\r","\\"KFUPM\\"\\r","\\"abcabb\\"\\r","\\"abbaoii\\"\\r","\\"aaaa\\"\\r","\\"TechBench\\"\\r","\\"Kbbooddae\\"\\r","\\"C\\"\\r","\\"Pool\\"\\r","\\"hardtofindanswer\\"\\r","\\"easytofound\\"\\r","\\"testofilabo\\"\\r","\\"kfupmsahrnet\\"\\r","\\"saharanetkfupmtechbench\\"\\r","\\"kfupmKFUMPsaharanEttEst\\""]],"outputs":["5\\r","5\\r","3\\r","4\\r","1\\r","5\\r","3\\r","1\\r","2\\r","9\\r","7\\r","9\\r","12\\r","10\\r","13"]}	15	3
Zero Sums	Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? return the number of unique triplets in the array which gives the sum of zero.\n\nzeroSums([-2, -1, -1, 2, 3, 4]) should return 2\n(because there are two triplets whose total is 0: [-2, -1, 3], [-1, -1, 2])\n\nzeroSums([-4, -2, -2, 2, 2]) should return 1\n(because there is only one triplet whose total is 0: [-4, 2, 2])\n\nzeroSums([7, 7, 7, 7]) should return 0	zeroSums	Integer	[{"name":"nums","type":"Integer Array"}]	{"inputs":[["[1, 2, 3, 4]\\r","[0, 0, 1, 2]\\r","[0, 0, 1, 0]\\r","[-1, 3, 4, 2, -1, -2]\\r","[3, -3, 0, -1, 1, 0, 2, -1, -1, 0]\\r","[-1, 1, 1]\\r","[5, -1, -1, 2, -2, 4, 1, 0, -5]\\r","[1, 11, -9, -2, 3, 5, 2, 1, -1, -3]\\r","[2, 2, -2, -4, -2]\\r","[1, 2, 3, 0, 4, 9, -13]\\r","[2,-2,5,-5,0,0,4,7,9,-6,-8,1,-1,-1]\\r","[]\\r","[7,7,7,7]\\r","[10,4,4,7,-8,-9,6,-8,6,2,1,7,1,2,2,-3,0,0]\\r","[2,7,14,-15,1,18,0,20,-10,-11,4,2,1,-3,-15,-14,-13]\\r","[48,77,-10,-10,-75,2,41,-99,5,-7,3,-71,72,77,-80,8,9,11]\\r","[4,-8,7,-3,4,55,-6,0,-2,2,1,-1]\\r","[4,0,1,2,3,4,5,-3,-4,-7,-10,1,-1,0]\\r","[4,1,-8,7,7,-14,2,-2,0]\\r","[4,8,0,-10,4,-3,2,1]"]],"outputs":["0\\r","0\\r","1\\r","2\\r","5\\r","0\\r","5\\r","5\\r","1\\r","1\\r","11\\r","0\\r","0\\r","5\\r","6\\r","5\\r","8\\r","9\\r","3\\r","2"]}	20	3
\.


INSERT INTO "challenge" ("name", "description", "method_name", "method_type", "tests", "parameters", "points")
        VALUES ('Reverse a String', 'Reverse the provided string. Your result must be a string. Write your own code.', 'reverseString', 'String', '{
                                   "inputs":[["hello","kfupm","racecar","Howdy","Greetings from Earth"]],
                               
                               "outputs":["olleh","mpufk","racecar","ydwoH","htraE morf sgniteerG"]}', '[{"name":"str","type":"String"}]', 5), ('Factorial', 'Return the factorial of the provided integer.\n\nOnly integers greater than or equal to zero will be supplied to the function.', 'factorialize', 'Integer', '{"inputs":[["5", "10", "4", "0"]],"outputs": ["120", "3628800", "24", "1"]}', '[{"name":"num","type":"Integer"}]', 4), ('Longest word', 'Return the length of the longest word in the provided sentence.\n\nYour response should be a number.', 'findLongestWordLength', 'Integer', '{"inputs":[["The quick brown fox jumped over the lazy dog","May the force be with you","Google do a barrel roll","What is the average airspeed velocity of an unladen swallow","What if we try a super-long word such as otorhinolaryngology"]],"outputs:["6","5","6","8","19"]}', '[{"name":"str","type":"String"}]', 5), ('Repeat String', 'Repeat a given string str (first argument) for num times (second argument). Return an empty string if num is not a positive number.', 'repeatString', 'String', '{"inputs":[["*","abc","abc","*","abc"],["3","3","1","8","-2"]],"outputs":["***","abcabcabc","abc","********",""]}', '[{"name":"str","type":"String"},{"name":"num","type":"Integer"}]', 5), ('Truncate String', 'Truncate a string (first argument) if it is longer than the given maximum string length (second argument). Return the truncated string with a ... ending.', 'truncateString', 'String', '{"inputs":[["A-tisket a-tasket A green and yellow basket","Peter Piper picked a peck of pickled peppers","A-","Absolutely Longer"],["8","11","1","2"]],"outputs":["A-tisket...","Peter Piper...","A...","Ab..."]}', '[{"name":"str","type":"String"},{"name":"num","type":"Integer"}]', 4), ('Palindrome', 'Return true if the given string is a palindrome. Otherwise, return false.', 'palindrome', 'Boolean', '{"inputs":[["eye","_eye","race car","not a palindrome","nope","almostomla","My age is 0, 0 si ega ym.","1 eye for of 1 eye.","0_0 (: /-\\ :) 0-0"]],"outputs":["true","true","true","false","false","true","false","true"]}', '[{"name":"str","type":"String"}]', 9), ('Roman Numeral', 'Convert the given number into a roman numeral.\n\nAll roman numerals answers should be provided in upper-case.\n\n', 'convertToRoman', 'String', '{"inputs":[["2","4","12","16","68","99","649","3999"]],"outputs":["II","IV","XII","XVI","LXVIII","XCIX","DCXLIX","MMMCMXCIX"]}', '[{"name":"num","type":"Integer"}]', 8), ('Caesars Cipher', 'Write a function which takes a ROT13 encoded string as input and returns a decoded string.', 'rot13', 'String', '{"inputs":[["SERR PBQR PNZC","SERR CVMMN!","SERR YBIR?","GUR DHVPX OEBJA SBK WHZCF BIRE GUR YNML QBT."]],"outputs":["FREE CODE CAMP","FREE PIZZA!","FREE LOVE?","THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."]}', '[{"name":"str","type":"String"}]', 4), ('Sum All Primes', 'Sum all the prime numbers up to and including the provided number.', 'sumPrimes', 'Integer', '{"inputs":[["10","15","20","25","977"]],"outputs":["17","41","77","100","73156"]}', '[{"name":"num","type":"Integer"}]', 5), ('Missing letters', 'Find the missing letter in the passed letter range and return it.\n\nIf all letters are present in the range, return empty string.', 'fearNotLetter', 'String', '{"inputs":[["abce","abcdefghjklmno","stvwx","bcdf","abcdefghijklnopqrstuvwxyz"]],"outputs":["d","i","u","e","m"]}', '[{"name":"str","type":"String"}]', 5), ('Spinal Tap Case', 'Convert a string to spinal case. Spinal case is all-lowercase-words-joined-by-dashes.', 'spinalCase', 'String', '{"inputs":[["This Is Spinal Tap","thisIsSpinalTap","The_Andy_Griffith_Show","Teletubbies say Eh-oh","AllThe-small Things"]],"outputs":["this-is-spinal-tap","this-is-spinal-tap","the-andy-griffith-show","teletubbies-say-eh-oh","all-the-small-things"]}', '[{"name":"str","type":"String"}]', 5), ('Pig Latin', 'Pig Latin takes the first consonant (or consonant cluster) of an English word, moves it to the end of the word and suffixes an "ay". If a word begins with a vowel you just add "way" to the end.', 'translatePigLatin', 'String', '{"inputs":[["california","paragraphs","glove","algorithm","eight"]],"outputs":["aliforniacay","aragraphspay","oveglay","algorithmway","eightway"]}', '[{"name":"str","type":"String"}]', 5);
--
-- Table structure for table "submissions"
--

CREATE TABLE "submission" (
    "id" SERIAL,
    "timestamp" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "code" TEXT NOT NULL,
    "score" INTEGER NOT NULL,
    "is_solved" BOOLEAN NOT NULL DEFAULT FALSE,
    "language" VARCHAR(10) NOT NULL,
    "player_id" INTEGER NOT NULL,
    "challenge_id" INTEGER NOT NULL,
    FOREIGN KEY (player_id) REFERENCES "user" (id) ON DELETE CASCADE,
    FOREIGN KEY (challenge_id) REFERENCES "challenge" (id) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

-- provided the field is named the same thing in
-- all tables that use this, you can use a centralized function

CREATE FUNCTION update_submission_timestamp ()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.timestamp = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;

CREATE TRIGGER submission_time_modtime
    BEFORE UPDATE ON submission
    FOR EACH ROW
    EXECUTE PROCEDURE update_submission_timestamp ();

CREATE TABLE "token" (
    "string" VARCHAR(50) NOT NULL UNIQUE,
    "is_used" BOOLEAN NOT NULL DEFAULT FALSE,
    "user_id" INTEGER
);

INSERT INTO "token" ("string")
    VALUES 
        ('09DC38C16890AFDB86BBAF660AEE9939'),
        ('881B8699A3164EAAED14B8B1282C8CAE'),
        ('16F50A1A04ED3C26BA2DD52AA821BA32'),
        ('CE33AF609A3AB394B0EA9761353A1503'),
        ('6804E8EF199B8EB2082991E3A666DAF3'),
        ('BBFF348DF4C59221725C75A36487DF26'),
        ('47B351AB8D6935B385E4465F2B4A3505'),
        ('7992660B17434282F4F3B18392E38CD7'),
        ('85B819D5BDFA1D3C010F67F8D075B2FE'),
        ('873466FD69CF8904DB14DE0783F2D723'),
        ('9AC81D4E1CB6124951918226638D724B'),
        ('19902C93E6C476FEDA6678B4C082F3C3'),
        ('426529595DD033B267DB300ACE007C18'),
        ('5A3A44F83E92E1D8737D679EFE8E1817'),
        ('CD979455E8E3ECF17CCF1C2BA17AB3DE'),
        ('AECEDD1D3544F2B83B0392DEC1E418BB'),
        ('6A2D70DC5E92518DA35A65D48C488528'),
        ('3BBB5443AACFB3B3B66A12D5DC7BDF1D'),
        ('FB796E7784453D9E309443002DB36BC6'),
        ('A6CF1479AD5EDB1F9D132FFD63E40FA8'),
        ('12C8BB414FEF36049D23B8A40DD93FA7'),
        ('EB95EFB782A8F57E92A42DBAE5BE4584'),
        ('255B9986D90C94849E8263FB6B5502C9'),
        ('4A7DB5F39101C32D5D2B923CE8003A95'),
        ('CDBB713A8198B3810AAC79AB18F1EB73'),
        ('CF1E320F5364778EB5179F688B4C00DB'),
        ('E47E579E1CCD9547CDF65FCEA4441CFF'),
        ('B9171AA5BA28E05FF2574DBDF52C5E46'),
        ('B620533587E7BB8EABD8C2A0DFB3D6A3'),
        ('3DD311A17353A26887BB9312692FFB98'),
        ('0FDBE32FA147BC657FA40117CDF23D93'),
        ('01F50CB34B89C036CD815BDB8D5A15D7'),
        ('7766330CC46AC7DD3BC1E652A2831DEF'),
        ('D54DB12741E986BA6205CF4F7CE744B1'),
        ('AD96A4C660A163D3075E12158E05496D'),
        ('437B898D2FFE9AB154449FE2F3E440B7'),
        ('69EE779DA6368745DD26F34DA4D1FB9C'),
        ('80703D04A8603573A5DE8483A7A9820B'),
        ('A6B2DDB5B1C992ABA91D64D4E003EB23'),
        ('F165BC2A4F232AE19F86A11547549E04'),
        ('15C19218D925B547B4A55A98B423C836'),
        ('B54EDAA7E1A523D48441629632E566FF'),
        ('BEB7730E254E56577A742078430931E5'),
        ('6A22844DD99AA019BA4EB8DB1C6775ED'),
        ('15FEF53DAF9E233966B64BE6C3DD8854'),
        ('3FB2919CAFC03009482DAE40699935AE'),
        ('A79A0AE94303CB7FAF217372FE4F2DDE'),
        ('1CAC7D6A97933ECF8BB877687659B595'),
        ('2D6B5E9DA4867514C985C8BD8EE0765E'),
        ('D082647389D29D52361A956F0AC372EE'),
        ('B6BBE100231175FFF1C2A43A2BE13E36'),
        ('9E766D42C55BB6B3FAD7D1A597849B17'),
        ('BB5A39531FAC1E70D5B26135406456EE'),
        ('4C8B4B83BE7A0503F3B06574765FC4EA'),
        ('54FC4DF1A315401F7DF60E2FED863237'),
        ('FFE8D0FEB19C6BEF2F4189AB97A8906E'),
        ('60B23CFF5D389860CE9AFD8BCEA7378C'),
        ('864B13434937F6E7AE363E65F1E902D6'),
        ('959D9D2E6E277D4821143B1B528D2F4D'),
        ('3EF0D61B85C2B4A3DDE3C7D81B2BBF47'),
        ('893F986CA36EFE8BC98D7C0522D5F743'),
        ('0FDC15293A3F90D6302A1CD1FD98C03A'),
        ('29432405BD5E14697D3CBC392A4D4EBB'),
        ('BA63CCCB31E0FD06CA4261174474ED8D'),
        ('1A50ED9FD2A6A5834C62D046005EDC31'),
        ('C56B2131E5378D6792F4614A45FB1FF4'),
        ('E3E78EB24C87AE26A0466595836F9AF2'),
        ('655FA44CBC893C444F5972EBA672D974'),
        ('025EEBD896D299E6430E585966794F2D'),
        ('F962B551209F86D60F351F3BF5B4E0DB'),
        ('2E8ACD6A5006E4147F9D56A9022A8B28'),
        ('3DCC5763DC745BF33AC305323F13F790'),
        ('363FC1691E7EDFEDEBD829986DDB017D'),
        ('8261AF0A79D31825817FDF8D1FC48FE2'),
        ('5111AF6BACC8AAFF23BF2B571C5554BE'),
        ('119CE0ABE15B8143B57ECCA34E81F8A6'),
        ('A553EAC79AC66452C395DEEF5B2A6C84'),
        ('C06F939F80BBAC08358DF2AE0F413EC9'),
        ('612C2CC4B8CF7192C5B14CBC8679D67D'),
        ('EE30C65B9AEC04774E7FB25A9A1A90E5'),
        ('6EE9C0A0ADF3FDA12ECF2EE1187B15C4'),
        ('DC6A00AD407C908B3AA2DC49393D783C'),
        ('F5BE4538D03366E97C4B517514D11501'),
        ('E53CBC76B921B88DBFFBCCB715C1BAFC'),
        ('3E791B446BE54EA83EA06A06D6DB99C8'),
        ('59D653F040654B82234912DF422EEAD9'),
        ('C63526BCB11CA26157312C823C9A2CE6'),
        ('2095CA17D9DDB11FF7B7C947818D3951'),
        ('A1D001AF9A4DF70769A0BDB13807D560'),
        ('FD01CC56E836A050CBBDDF0D863A02A1'),
        ('F23787B1B94F6909FA1168BD046E7F3E'),
        ('EFEC8E0E668BAD1B15AC35B96B6CFF23'),
        ('478C8B1522588D7A88B1392EAA9E9B40'),
        ('9F7640D289CA88E529D784F5BA2B5871'),
        ('4D78AD8A389D301C9CC8B09368525042'),
        ('59C61DE4DB6BC391A694A58B18BBC98C'),
        ('15D7109CB2147C0E99EBAECA118A151E'),
        ('B34F6FDBAD2C36B797ECA0296FF82CC9'),
        ('B80280EB9D65040C3A36568349CB684B'),
        ('AB43DCFDC03E9CDCDC0AA761DCDA43BA'),
        ('B1AC42C35ECF1128709D967CBBD43770'),
        ('BC2FEAF21112F4F3C20F82905D35069A'),
        ('537ABE9F2823369E9D589C47A3067EB5'),
        ('334FFF2250CB1483D85D238298DD1BE2'),
        ('9E7978F273511BDDFE4022664732EFC7'),
        ('4E132F02A6EC3733EB815F638DEEDABE'),
        ('1111587FB0235E124FCC966029562797'),
        ('90D36D153EF25FBCA8B4F98E136CA0D9'),
        ('0D9642C5628B3DBA05408FF0F83C1924'),
        ('E63E63A6BB163BDCABEAF8E878FFE141'),
        ('804948307B94481E23F068526EB6A237'),
        ('9ABC47BDEDCE24A4997053DF27890AC9'),
        ('4A503593CD8A797BB7F17E0A5D843720'),
        ('07AB6923DC4C09E00FD2EBFBDC45078E'),
        ('0FC84BDD006AB8FF0E16E7024320E9E3'),
        ('914889502A84ABAE6267A63A11888215'),
        ('E256D353A72A0D8F46732F8E3C2BE1FE'),
        ('7849E3EFF62BC2CC36EA268D2A27A423'),
        ('F118FAB85FB28EDC3089942AC1714FE3'),
        ('7BBEAAF806CF85EA264D3A9508880638'),
        ('C1F0114AB41C4F37C0D2776012BFAF6F'),
        ('0D939AA615F78630C907CC05C7C672C1'),
        ('BD0D77EFE133FB27355586C36C68A7B7'),
        ('5731F9D6A98D9A4E889DE6B1007EE103'),
        ('0882592A4D63D835B9A2CFB5E527B87B'),
        ('259D732D61190780C428358956F60B91'),
        ('FF5289FEE8CB11F67A823E6140F88228'),
        ('C6DAEB07D600ED677D46167BFD028667'),
        ('CD23E3450E05C9F8C9F5122C02A0F79E'),
        ('193260DB74D48D7F62D6704A9951D3EC'),
        ('C15EEE40A5D41437F15113578C2FC91D'),
        ('F48C6F34BE5B49C42C806885CB9A6C31'),
        ('0D4B06101C40A2129B9B001B84B0DCAC'),
        ('E81A68C6988D09935931EC5F911F2E7E'),
        ('8F02FA4F9ECF812F578D9FF9301C95AB'),
        ('D2276E2802F3F91D4F83CAC7E594A192'),
        ('FCACAD51F7C6C0DE5A555ED22A40294D'),
        ('EB58DC3011155BD240E884A71867B5AE'),
        ('E83ADE677A7CC08D6EA044B46C376763'),
        ('10902621956E44BD004FF99974526B72'),
        ('585EBE5377DB88EE104729B99B109793'),
        ('920EA7C8CDF8A7AD88B450C97C72916B'),
        ('8E0A63AD0C6E20E4B54599F8F04193FF'),
        ('1B134947430481E830D6551065A74E8B'),
        ('5102B20F9067DF073D6ABF16692FBFA5'),
        ('C58056E3923323F61B48030A97046C4E'),
        ('A5969011BE14B21BBC5C7A1E5C22AF86'),
        ('D945E8946E044824FC8294EA50E3350E'),
        ('272D297DE64E98CCA5D0643F8013981B'),
        ('37525C8DDDA06F8C4C49979E283406A8'),
        ('643E12A39357863DC0AAEFFE3CBAFB81'),
        ('2779BC1EBAFBE2DCB0CBDD85D3DC6DD3'),
        ('F175AED08CE1D958C694C86A38FF45EA'),
        ('CD6137C2067631D1F27DB2FC23431D65'),
        ('6929F3E16971D5645C577AA3CDE6C107'),
        ('23EAF8C7E8EB2962D87DDE5B7F1D9BEE'),
        ('1DDB45D93FAA9E606140D33F50EE0BDB'),
        ('F4C747560C0582501E915D7ECDFC426E'),
        ('521CCB84D17328F05F3361F8C2CB19D7'),
        ('B184ADC9A504945BE2D596407FCD70EC'),
        ('A5E10F388894A47CB334522A936A2B02'),
        ('CA1FA46C9600EA4BEA882FB4F32FBE9C'),
        ('5ECA910445B46335808A699AE496F245'),
        ('5CA319BDDCAD734586F24DE37B60EF45'),
        ('381299EECC457927A4B2747A5369B0BD'),
        ('9DFB7159DADB92AB77BDAB5BA0CE67FE'),
        ('39F5C2489AEEBDB6F0EE17908F74527B'),
        ('E2DD6FCED0F733D1251C29077DF2FEEF'),
        ('F0319FB2729101C36CE68C122BB63AD2'),
        ('F64F2291F1B38F4E23297A276625F44D'),
        ('C10EE3B57CAA70A430175F87FF543EBA'),
        ('AEDF598221BE3D03FEB23D6249D7219B'),
        ('BEB6A09C59D34D2E657125E2E590EEBB'),
        ('CC77C2086FCEB790F89A0CCA4FF402CA'),
        ('894981588DDD57AF42AB3C3A18F0B9EF'),
        ('5DE0EF55923659084D0DAB5762132C6E'),
        ('80B5C2061DFF560B97446C106621DBFE'),
        ('A182C7333AFA078AC84B15B9A1D164EB'),
        ('58469CE4F2CD6BDF4D1E5ECE495F65EA'),
        ('B63499120A3D9B74B8A8A3999C7C20A6'),
        ('E1793F425BC43B052EB42688969A1ECE'),
        ('4720F43E50A1FF2A318541F4835E6922'),
        ('444F2AA62DF4E350C9B0CEB6ED337DAF'),
        ('4BD549AAE8B901E4A26D23EF4B2D1CFB'),
        ('98C603EBD4F35B122CDB76CB9ABE150A'),
        ('67B2B5E32948977B908034BB6F4AA952'),
        ('25112C9343DBBBAE24E637EF83FEFDFA'),
        ('6C411DB548E6414888E242ABCD01E986'),
        ('88E905C13425535B650B7CBCFFFDE145'),
        ('EE72F9686C8422800CD5BA5E5D1F298C'),
        ('063BCD224F9A069EA6DD7307CD486130'),
        ('A7CFCA276AB09D57EA00BA7F83E024BE'),
        ('6DA6A81A1F25491F9AA8132921E1A90B'),
        ('66E306A4006797E91BDD6F1F326EEB63'),
        ('4B78D605DA03E120C67CC3DABDAA668B'),
        ('CD0A8EF2552001C2F910ABF84D7ADB65'),
        ('3345E0EBD33A34B084C57B3B9E0F9315'),
        ('B9BB644304337DF3442889D30C041D18'),
        ('C0C1517BB5F5C78A9A248D1BC76D3F6B'),
        ('CCCE7F7B9A8759F8CBB165AC855E622F'),
        ('9628BCD04371B419C948738E9B38ABAD'),
        ('E32782A9F8966D2D34FF47024C6D7C63'),
        ('9250F464C864DC07954B2691657773DC'),
        ('73D2D322B59CF66A0B4922E38D7D926F'),
        ('FF9AB105CE6AEA56C4E27CD203F11874'),
        ('36995E663E5E45976AC6A93D05EC5843'),
        ('6634C866C8C4941F4694766097331D10'),
        ('79D1DEDCD142B07AE60453A44D0B38B4'),
        ('94000F65CEE8A7D6BA77C52712DBB70E'),
        ('B03F05D2626F4916277745B09F2C7C77'),
        ('12DAB928530739308EA77C7CEF7324C7'),
        ('34F00915D5A4904E09CF79F88A93931F'),
        ('BE649255BA802CF3B26D112142C131A8'),
        ('BEF6446BA0B235FB5EB17810D8B270F9'),
        ('0919F66BEE1C742B633EF873D01561CB'),
        ('88AB6083BAFAA5EA7689A6913F9D1E37'),
        ('66E94FC28DAF4ECAF8208B440BAE2BC2'),
        ('EAE5FE028A79F2B817E7FCF1FBEA780F'),
        ('4AE7B805159CC148EFA58DAB32DCA69A'),
        ('A3E25A00C734DA4B16A50562071D4FCA'),
        ('068EE3B1AE7BEB6DE5EFFE1AB668913F'),
        ('A8B636A948000D3335A3EA4F6924B30A'),
        ('21964834D8256AD8E7D912DE940AD9AC'),
        ('EF984B50149760F605C401FF8C5D340C'),
        ('D9025C5F6336C518C5715485D2A0A645'),
        ('33E4F2CE8A3B0D015798806E0B1F2FB9'),
        ('ED1147DBCDF11D9D716C170DEF5BBA0D'),
        ('045E1AF6ABA8EBF5D280D42626D31770'),
        ('2A4DA4C163DD8782D4C3FC709376FDB6'),
        ('28C98CA9132B5394610A63828427210E'),
        ('CAA2750F9C485FC2A078199B6358AF12'),
        ('F2197A3B5B2F51A23919F19E0BBE5BB5'),
        ('E8F334FD4BC2A7D77A7EDD66EDDC2C4D'),
        ('78D0727565A3DD6CF80D273038B59F95'),
        ('D7FBADC90D511E9CFAD611FA74C5F55F'),
        ('8C0BF812219A2DE60F8144A4BFB09BE1'),
        ('E6B5055AF4CB95A2B40A9DD9144C47ED'),
        ('F0EFBB3D085C4D11494803937C3CF559'),
        ('87A9A27035510C2E59E4DB86A3DBA26F'),
        ('3BD8E343838591784F76951684089A7D'),
        ('66F4F352162FC10A5A41F7BBB5D7F58E'),
        ('C58E42A319697A6AD846F8E3838F415A'),
        ('C16E9E3B21846DAEEF228BF9876454A2'),
        ('98C6C8FC09F3F68413DE020D8F6EE883'),
        ('1077BC558C05B3A7046E89FAA06D3FC5'),
        ('6DDFC0D501E70C6C7E7CEFD7BF202E49'),
        ('DD6DE87B9356AF0061FB052F84C57636'),
        ('67E17D32D160F3E301849DEED9EB08DB'),
        ('B1F270C2334384FDE401689D9FDB04F7'),
        ('06A4437ECE1F9901C92A11AB6E99A9F0'),
        ('25DC0071BCABC0170F74CABD201AFA7C'),
        ('D831CD72E0C7353C4E8B9BD00948F266'),
        ('37A3D5CA0F02820181798FCBA91C05C3'),
        ('A566C09FA14125FFDAD092649D08C1EC'),
        ('0EEF8DBB46EF14072236A76AA301843F'),
        ('C58BB9B13FFE6A1D535CA4E6086CFD78'),
        ('0FF8E5045310E5A7915522CA7DBEAC21'),
        ('E9AD02677B1A70BC3CB8ADE635E8DB73'),
        ('49221E60567CB018E6AF04D5E0CBF45D'),
        ('51EFA08B1A8CDD58C2AC0C45E261931C'),
        ('8BBC2DB3E4E9FEC6C10B5DE020AD83D4'),
        ('9255058812ABC51532B3A2E49B93F676'),
        ('740F077F55E35BE831B56FED732A2B25'),
        ('D281212E4EA71670F4975A71278DDD60'),
        ('F6C4D8610E1862E46EBF6CA8D2F8F638'),
        ('43505CFD9D4EC2C86EC5295322845F6F'),
        ('F0438952BA81F562BF8337AE9D660795'),
        ('807E4438336C74960023D6411CF0D307'),
        ('3EEEA851233CC8225AC842FFBFC42803'),
        ('1BBF25E0E846646984B99252E55C832E'),
        ('FFE1421E41D418F809B7166B45B6A3BC'),
        ('E5EE670A038FC893D58FF3693A2683FC'),
        ('65117B75DAA5940A5AF6D60CB147F081'),
        ('68D7E74EF7EAD51C18C28BA68034B859'),
        ('B24BE6B487A9D7A62E5683A66B22CAFD'),
        ('1416B47DD9EC7483303FF20FE10054DE'),
        ('D25F90A883F16B858F96127BA055AEC4'),
        ('5BE8866611B3C1B23AC75B189024224D'),
        ('EA9920E6F70E6AE3F65D99EABD4AA36F'),
        ('E5989003BE35D1EE4FD31F7EFCC75E10'),
        ('802F16C2733B31E14D2F88D1A132FF1E'),
        ('F1D1F772DBC5D6C1CE0D0BF7EB35BA90'),
        ('5A609C7C2D5669543EFC22AD7F360148'),
        ('A8A92E50CBC6C8B2F334B21C5B99DC46'),
        ('B8B56BEF5596E3788B71C5C6E6666440'),
        ('BE5B593EF01A98AC3874CAC21D2A4511'),
        ('7CF6A60E6BC048C8EC8B4289C15AAC81'),
        ('0675A64C2A7D71F082551FA5154DE940'),
        ('C6180DE17607AB12C63069143DD4B35C'),
        ('399C1390BB416ADD0A0B6C8D6C9239E1'),
        ('86D524BDBF671BB270B7CB7331D0962E'),
        ('95F09BC247D7A4D1D6E88F843451567C'),
        ('449EDA2A8E27731295F993C83F62CF32'),
        ('B19300F94AC7F3E5FDED1E4066DE6A81'),
        ('5A3067C700F0A85FB7C6CF56F71EA5CD'),
        ('AEC8BA1E30691C758690470105E1AAFC'),
        ('13FB5838DB08F2341BBFB0D42ABB3640'),
        ('37BA1CF673FCA2458BECB5F26491E50D'),
        ('AA57E3841F0AEA35E17B7BD39A616361'),
        ('7F9AE5F8B3D44193444C75AD728C7434')
;