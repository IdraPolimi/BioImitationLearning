function MoroStrettoReflexok(ID1,ID2,ID3,ID4,ID5,ID6)
global dcps;
global massimo
global minimo
T1=[ -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23159, -0.23313, -0.23313, -0.23313, -0.23159, -0.23313, -0.23313, -0.23313, -0.23313, -0.26227, -0.26381, -0.26381, -0.26381, -0.26227, -0.26381, -0.26381, -0.26227, -0.26227, -0.26227, -0.26381, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26074, -0.26074, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26074, -0.26074, -0.26074, -0.26074, -0.26074, -0.26074, -0.26074, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26074, -0.26227, -0.26227, -0.26074, -0.26074, -0.26074, -0.26074, -0.26074, -0.26227, -0.26227, -0.26074, -0.26074, -0.26074, -0.26074, -0.26227, -0.26074, -0.26074, -0.26074, -0.26074, -0.26074, -0.26227, -0.26074, -0.26074, -0.26074, -0.26074, -0.26074, -0.26074, -0.26227, -0.26227, -0.26227, -0.26227, -0.26074, -0.26074, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26227, -0.26381, -0.26381, -0.26227, -0.26381, -0.26841, -0.27148, -0.27454, -0.27761, -0.28528, -0.29449, -0.30216, -0.30983, -0.30983, -0.30983, -0.30829, -0.30829, -0.30829, -0.30676, -0.30676, -0.30676, -0.30369, -0.30369, -0.30369, -0.30369, -0.30369, -0.30522, -0.30522, -0.30369, -0.30522, -0.30369, -0.30522, -0.30522, -0.30369, -0.30522, -0.30522, -0.30522, -0.30369, -0.30369, -0.30369, -0.30522, -0.30369, -0.30522, -0.30369, -0.30369, -0.30522, -0.30522, -0.30522, -0.30522, -0.30522, -0.30522, -0.30522, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30829, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30829, -0.30676, -0.30676, -0.30829, -0.30676, -0.30829, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30829, -0.30676, -0.30829, -0.30676, -0.30676, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30676, -0.30676, -0.30829, -0.30829, -0.30676, -0.30676, -0.30829, -0.30829, -0.30676, -0.30676, -0.30676, -0.30829, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30829, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30829, -0.30676, -0.30676, -0.30829, -0.30676, -0.30676, -0.30676, -0.30829, -0.30829, -0.30829, -0.30676, -0.30676, -0.30829, -0.30676, -0.30676, -0.30676, -0.30829, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30829, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676, -0.30676];
T2=[ -1.62608, -1.62762, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62762, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62762, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62762, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62608, -1.62762, -1.62762, -1.62915, -1.62915, -1.63068, -1.63068, -1.63068, -1.63068, -1.63068, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63375, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63375, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63222, -1.63068, -1.63222, -1.63222, -1.63222, -1.63222, -1.63375, -1.63222, -1.63222, -1.63222, -1.63375, -1.63375, -1.63222, -1.63375, -1.63375, -1.63375, -1.63375, -1.63375, -1.63375, -1.63835, -1.64142, -1.64449, -1.64909, -1.65369, -1.65830, -1.66443, -1.66903, -1.67517, -1.68284, -1.68898, -1.69511, -1.69818, -1.70432, -1.70892, -1.71352, -1.71812, -1.72272, -1.72733, -1.73193, -1.73653, -1.73960, -1.74573, -1.75187, -1.75801, -1.77028, -1.77335, -1.77948, -1.78408, -1.79022, -1.79482, -1.79942, -1.80556, -1.80863, -1.81323, -1.81783, -1.82397, -1.83010, -1.83624, -1.84698, -1.85465, -1.86385, -1.87459, -1.87919, -1.88533, -1.89146, -1.89913, -1.90987, -1.92061, -1.92828, -1.94209, -1.95589, -1.96510, -1.96970, -1.97277, -1.97277, -1.97277, -1.97277, -1.97277, -1.97277, -1.97277, -1.97277, -1.97277, -1.96970, -1.96203, -1.96203, -1.96356, -1.96356, -1.96510, -1.96356, -1.96356, -1.96356, -1.96356, -1.96510, -1.96356, -1.96356, -1.96510, -1.96356, -1.96510, -1.96510, -1.96510, -1.96356, -1.96356, -1.96510, -1.96356, -1.96510, -1.96510, -1.96510, -1.96356, -1.96510, -1.96356, -1.96510, -1.96510, -1.96510, -1.96510, -1.96663, -1.97277, -1.97277, -1.97277, -1.97277, -1.97430, -1.97277, -1.97277, -1.97430, -1.97430, -1.97583, -1.97737, -1.98044, -1.98657, -1.99117, -1.99884, -2.00651, -2.01418, -2.02185, -2.03106, -2.03413, -2.03566, -2.03566, -2.03719, -2.03719, -2.04026, -2.04333, -2.04793, -2.05253, -2.05253, -2.05407, -2.05560, -2.05867, -2.05867, -2.06020, -2.06174, -2.06327, -2.06481, -2.06634, -2.06941, -2.07094, -2.07094, -2.07094, -2.07094, -2.07094, -2.07094, -2.07248, -2.07401, -2.08015, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.08567, -2.07861, -2.06634, -2.04947, -2.03259, -2.01725, -1.99884, -1.98350, -1.96510, -1.94822, -1.93135, -1.91601, -1.90067, -1.88686, -1.86845, -1.85158, -1.83471, -1.81783, -1.79942, -1.77488, -1.75801, -1.74573, -1.73500, -1.72272, -1.70892, -1.69358, -1.67977, -1.67210, -1.66290, -1.65216, -1.63375, -1.62148, -1.60614, -1.59080, -1.57699, -1.56472, -1.54938, -1.52791, -1.51103, -1.49416, -1.47115, -1.45121, -1.43587, -1.41899, -1.40212, -1.38524, -1.37297, -1.36070, -1.34843, -1.33616, -1.32388, -1.31161, -1.29627, -1.28247, -1.26866, -1.25792, -1.24872, -1.24105, -1.23645, -1.23184, -1.22571, -1.21957, -1.21497, -1.21344, -1.21344, -1.21344, -1.21344, -1.21344, -1.21344, -1.21344, -1.21344, -1.21190, -1.21344, -1.21344, -1.21190, -1.21190, -1.21037, -1.21037, -1.20730, -1.20423, -1.19963, -1.19503, -1.18889, -1.18122, -1.17662, -1.17048, -1.16281, -1.15208, -1.14287, -1.13060, -1.11373, -1.09992, -1.08458, -1.06617, -1.04470, -1.02475, -1.00635, -0.98794, -0.96493, -0.94345, -0.92504, -0.88823, -0.87749, -0.85908, -0.83454, -0.72102, -0.68727, -0.63205, -0.62285, -0.61978, -0.61364, -0.60597, -0.59370, -0.58143, -0.57222, -0.55842, -0.54615, -0.53387, -0.52160, -0.51086, -0.50166, -0.48479, -0.46945, -0.45717, -0.44797, -0.43877, -0.42956, -0.42343, -0.41882, -0.41576, -0.41115, -0.41115, -0.40962, -0.40962, -0.40809, -0.40809, -0.40809, -0.40962, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40809, -0.40962, -0.40962, -0.40962, -0.40962, -0.40962, -0.40809, -0.40962, -0.40962, -0.40962, -0.40962, -0.40962, -0.40962, -0.40962, -0.40962, -0.40962, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41115, -0.41269, -0.41115, -0.41269, -0.41269, -0.41422, -0.41576, -0.41576, -0.41576, -0.41576, -0.41576, -0.41576, -0.41576, -0.41576, -0.41576, -0.41576, -0.41576, -0.41729, -0.41576, -0.41729, -0.41576, -0.41729, -0.41729, -0.41729, -0.41729, -0.41576];
T3=[ 1.60299, 1.60299, 1.60145, 1.59685, 1.59685, 1.59685, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59532, 1.59225, 1.59072, 1.59072, 1.59072, 1.59072, 1.59072, 1.58918, 1.58611, 1.58151, 1.57998, 1.57998, 1.57998, 1.57998, 1.57998, 1.57998, 1.58151, 1.57998, 1.57998, 1.57998, 1.58151, 1.58151, 1.57844, 1.57077, 1.56771, 1.56771, 1.56771, 1.56771, 1.56924, 1.56771, 1.56924, 1.57077, 1.57844, 1.57844, 1.57844, 1.57844, 1.57844, 1.57844, 1.57844, 1.57998, 1.57998, 1.58151, 1.58611, 1.59532, 1.60912, 1.61833, 1.63367, 1.64747, 1.65668, 1.66281, 1.66588, 1.66895, 1.67048, 1.67355, 1.67509, 1.67662, 1.68122, 1.68582, 1.69349, 1.69963, 1.70423, 1.70730, 1.71037, 1.71190, 1.71344, 1.71497, 1.71650, 1.71804, 1.71957, 1.72111, 1.72264, 1.72571, 1.72724, 1.72878, 1.72878, 1.73184, 1.73491, 1.73645, 1.73798, 1.74105, 1.74105, 1.74258, 1.74412, 1.74412, 1.74872, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.75025, 1.74872, 1.74872, 1.74872, 1.74718, 1.74718, 1.74718, 1.74718, 1.74718, 1.74565, 1.74565, 1.74412, 1.74412, 1.74412, 1.73951, 1.73951, 1.73798, 1.73798, 1.73645, 1.73645, 1.73645, 1.73645, 1.73031, 1.73184, 1.73031, 1.73031, 1.73031, 1.73031, 1.73184, 1.73031, 1.73031, 1.73031, 1.73031, 1.73031, 1.72878, 1.72878, 1.72878, 1.72878, 1.72878, 1.72878, 1.72724, 1.72724, 1.72571, 1.72111, 1.71650, 1.71344, 1.70883, 1.70116, 1.69196, 1.67969, 1.66435, 1.64901, 1.62907, 1.60759, 1.58765, 1.56771, 1.53856, 1.51402, 1.48487, 1.42351, 1.30693, 1.21795, 1.18727, 1.17347, 1.16733, 1.15659, 1.14279, 1.12438, 1.10751, 1.09063, 1.07069, 1.05075, 1.02927, 1.00013, 0.97712, 0.95564, 0.93570, 0.91422, 0.89121, 0.86667, 0.83599, 0.79610, 0.77770, 0.75162, 0.72707, 0.69946, 0.67338, 0.65037, 0.62583, 0.59055, 0.54146, 0.52612, 0.42488, 0.39573, 0.36198, 0.35124, 0.33590, 0.32210, 0.30522, 0.28682, 0.26841, 0.25000, 0.22699, 0.20858, 0.19171, 0.17483, 0.15643, 0.14109, 0.12421, 0.11041, 0.09660, 0.07973, 0.06745, 0.05978, 0.05058, 0.03831, 0.02604, -0.00158, -0.01385, -0.03686, -0.05680, -0.08134, -0.10435, -0.12583, -0.14577, -0.15958, -0.16725, -0.17185, -0.17338, -0.17492, -0.17492, -0.17492, -0.17645, -0.17799, -0.17645, -0.17645, -0.17799, -0.17799, -0.17799, -0.17799, -0.17952, -0.17952, -0.17952, -0.17952, -0.18105, -0.18105, -0.18259, -0.18412, -0.18566, -0.19179, -0.20100, -0.21480, -0.22861, -0.25315, -0.28230, -0.30377, -0.32525, -0.34519, -0.36207, -0.37894, -0.39581, -0.41729, -0.43570, -0.45564, -0.46945, -0.48939, -0.50780, -0.52620, -0.54461, -0.56609, -0.59063, -0.61211, -0.63358, -0.65353, -0.67500, -0.69494, -0.71489, -0.73483, -0.75170, -0.76551, -0.77931, -0.79005, -0.80232, -0.81766, -0.83300, -0.84681, -0.86215, -0.87902, -0.89743, -0.91431, -0.92965, -0.94192, -0.95266, -0.96493, -0.97567, -0.98794, -0.99714, -1.00481, -1.01402, -1.02322, -1.03089, -1.03549, -1.04163, -1.04623, -1.05237, -1.05697, -1.06310, -1.06924, -1.07384, -1.07691, -1.07844, -1.07998, -1.07998, -1.07998, -1.07998, -1.07998, -1.07998, -1.07998, -1.07998, -1.07844, -1.07384, -1.06617, -1.06464, -1.06464, -1.06464, -1.06464, -1.06310, -1.06004, -1.06004, -1.06004, -1.05850, -1.05697, -1.05697, -1.05697, -1.05083, -1.04623, -1.03856, -1.02936, -1.02015, -1.01095, -1.00174, -0.99561, -0.98794, -0.98027, -0.97567, -0.97106, -0.96646, -0.96186, -0.96033, -0.96033, -0.96033, -0.96186, -0.96186, -0.96186, -0.96186, -0.96186, -0.96186, -0.95726, -0.94499, -0.92965, -0.91431, -0.89897, -0.88056, -0.86215, -0.83914, -0.81613, -0.79159, -0.76551, -0.73943, -0.71335, -0.68727, -0.66120, -0.63972, -0.62131, -0.60290, -0.58603, -0.56609, -0.54615, -0.52620, -0.50780, -0.48632, -0.46791, -0.44797, -0.42803, -0.41115, -0.39275, -0.37894, -0.36513, -0.34979, -0.33445, -0.31911, -0.30684, -0.29304, -0.27770, -0.26542, -0.24395, -0.23781, -0.22401, -0.20867, -0.17952, -0.16878, -0.14731, -0.13350, -0.12736, -0.12123, -0.11202, -0.10282, -0.09362, -0.08288, -0.07367, -0.06447, -0.05680, -0.04913, -0.04299, -0.03686, -0.02765, -0.02152, -0.01538, -0.01078, -0.00925, -0.00771, -0.00464, -0.00464, -0.00618, -0.00618, -0.00618, -0.00618, -0.00618, -0.00618, -0.00618, -0.00618, -0.00618, -0.00618, -0.00771, -0.00618, -0.00771, -0.00771, -0.00771, -0.00771, -0.00771, -0.00618, -0.00771, -0.00618, -0.00618, -0.00771, -0.00771, -0.00925, -0.00925, -0.01078, -0.01231, -0.01231, -0.01231, -0.01078, -0.01231, -0.01231, -0.01231, -0.01231, -0.01231, -0.01078, -0.01231, -0.01231, -0.01231, -0.01078, -0.01231, -0.01231, -0.01078, -0.00925, -0.00925, -0.00771, -0.00464, -0.00311, -0.00311, -0.00158, -0.00158, -0.00311, -0.00311, -0.00311, -0.00311, -0.00618, -0.01078, -0.01231, -0.01385, -0.01385, -0.01385, -0.01845, -0.02152, -0.02612, -0.02765, -0.02765, -0.02765, -0.02765, -0.02919, -0.02919, -0.02919, -0.02919, -0.02919, -0.03226, -0.03839, -0.04299, -0.04606, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913, -0.05066, -0.04913, -0.04913, -0.04913, -0.05066, -0.05066, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913, -0.04913];
T4=[ 0.23466, 0.23619, 0.23619, 0.23619, 0.23773, 0.23773, 0.23773, 0.23926, 0.23926, 0.24233, 0.24693, 0.24847, 0.24847, 0.24847, 0.24847, 0.24847, 0.24847, 0.24847, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25307, 0.25460, 0.25614, 0.25614, 0.25614, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25307, 0.25460, 0.25460, 0.25460, 0.25460, 0.25460, 0.25614, 0.25920, 0.26074, 0.26381, 0.27148, 0.28068, 0.28835, 0.29909, 0.31289, 0.32517, 0.33897, 0.34971, 0.36198, 0.37732, 0.39113, 0.40647, 0.42027, 0.43255, 0.44635, 0.46016, 0.47550, 0.49237, 0.51078, 0.53072, 0.55220, 0.57061, 0.59055, 0.61202, 0.63350, 0.65037, 0.67032, 0.69026, 0.71327, 0.73628, 0.76082, 0.78230, 0.80377, 0.82372, 0.84212, 0.86053, 0.87894, 0.89888, 0.92036, 0.93877, 0.96024, 0.97865, 0.99706, 1.01853, 1.04001, 1.07222, 1.08296, 1.10444, 1.12438, 1.14125, 1.16273, 1.18421, 1.20415, 1.21795, 1.22869, 1.24096, 1.25170, 1.26091, 1.27011, 1.27931, 1.29005, 1.29926, 1.30386, 1.30539, 1.30693, 1.30846, 1.30999, 1.30999, 1.30999, 1.30999, 1.30999, 1.31153, 1.30999, 1.30999, 1.30999, 1.30999, 1.30999, 1.30846, 1.30846, 1.30693, 1.30693, 1.30539, 1.30539, 1.30232, 1.30386, 1.30386, 1.30079, 1.28238, 1.26858, 1.26858, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27011, 1.27318, 1.27471, 1.27471, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27778, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27625, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27625, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27471, 1.27318, 1.27471, 1.27471, 1.27471, 1.27318, 1.27318, 1.27011, 1.27164, 1.27011, 1.27011, 1.26704, 1.26397, 1.26244, 1.26091, 1.26091, 1.26091, 1.26244, 1.26244, 1.26244, 1.26244, 1.26244, 1.26397, 1.26244, 1.26244, 1.26397, 1.26397, 1.26244, 1.26244, 1.26244, 1.26244, 1.26244, 1.26244, 1.26091, 1.26091, 1.26091, 1.25937, 1.25784, 1.25630, 1.25477, 1.24863, 1.24710, 1.24096, 1.23790, 1.23483, 1.23176, 1.22869, 1.22562, 1.22409, 1.22102, 1.21642, 1.21335, 1.21028, 1.20568, 1.20415, 1.20108, 1.19801, 1.19341, 1.19034, 1.18727, 1.18421, 1.18114, 1.17960, 1.17654, 1.17347, 1.16733, 1.15813, 1.14432, 1.13512, 1.12285, 1.10751, 1.09370, 1.07836, 1.06302, 1.04921, 1.03694, 1.02007, 1.00473, 0.98939, 0.96791, 0.94797, 0.92803, 0.90655, 0.88201, 0.86053, 0.83752, 0.80991, 0.78690, 0.77003, 0.75315, 0.73628, 0.71634, 0.69639, 0.68105, 0.66571, 0.65037, 0.63964, 0.62890, 0.61356, 0.60129, 0.58901, 0.57367, 0.56447, 0.55833, 0.55680, 0.55680, 0.55680, 0.55680, 0.55680, 0.55527, 0.55680, 0.55527, 0.55527, 0.55680, 0.55527, 0.55680, 0.55680, 0.55527, 0.55680, 0.55680, 0.55527, 0.55527, 0.55680, 0.55680, 0.55680, 0.55527, 0.55680, 0.55527, 0.55680, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55527, 0.55680, 0.55680, 0.55680, 0.55680, 0.55527, 0.55680, 0.55680, 0.55680, 0.55680, 0.55833, 0.55833, 0.55833, 0.55987, 0.55833, 0.55987, 0.55987, 0.55987, 0.55987, 0.55987, 0.55987, 0.55833, 0.55833, 0.55833, 0.55833, 0.55680, 0.55680, 0.55680, 0.55680, 0.55527, 0.55220, 0.54299, 0.53379, 0.52305, 0.51078, 0.49697, 0.48470, 0.47550, 0.46323, 0.45249, 0.44328, 0.43101, 0.42027, 0.40800, 0.39573, 0.37886, 0.37119, 0.35891, 0.34818, 0.32670, 0.32056, 0.30829, 0.30369, 0.30062, 0.29449, 0.28221, 0.26687, 0.25000, 0.23619, 0.21932, 0.20705, 0.19938, 0.19631, 0.19324, 0.19324, 0.19171, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19017, 0.19171, 0.19171, 0.19017, 0.19017, 0.19017, 0.19171, 0.19171, 0.19171, 0.19171, 0.19171, 0.19171, 0.19324, 0.19324, 0.19324, 0.19324, 0.19324, 0.19324, 0.19324, 0.19324, 0.19324, 0.19478, 0.19478, 0.19478, 0.19478, 0.19324, 0.19478, 0.19478, 0.19324, 0.19324, 0.19478, 0.19478, 0.19324, 0.19478, 0.19478, 0.19324, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19478, 0.19784, 0.19784, 0.19784, 0.19784, 0.19784, 0.19784, 0.19938, 0.19784, 0.19938, 0.19784, 0.19784, 0.19784, 0.19784, 0.19784, 0.19784, 0.19938, 0.19784, 0.19784, 0.19938, 0.19938, 0.19784, 0.19784, 0.19784, 0.19938, 0.19938, 0.20091, 0.20091, 0.20091, 0.20091, 0.20091, 0.20091, 0.20091, 0.20091];
%plot(1:size(T1),T1)
size(T1);
% name1='MoroSLElbowRoll';
% name2='MoroSLElbowYaw';
% name3='MoroSLShoulderPitch';
% name4='MoroSLLShoulderRoll';
% learn_dcp_batch(ID1,T1,name1);
% learn_dcp_batch(ID2,T2,name2);
% learn_dcp_batch(ID3,T3,name3);
% learn_dcp_batch(ID4,T4,name4);
% if(any(massimo==1000))
%     massimo(1)=max(T1);
%     massimo(2)=max(T2);
%     massimo(3)=max(T3);
%     massimo(4)=max(T4);
% else
%     if(max(T1)>massimo(1))
%         massimo(1)=max(T1);
%     end
%     if(max(T2)>massimo(2))
%         massimo(2)=max(T2);
%     end
%     if(max(T3)>massimo(3))
%         massimo(3)=max(T3);
%     end
%     if(max(T4)>massimo(4))
%         massimo(4)=max(T4);
%     end
% end
%
% if(any(minimo==1000))
%     minimo(1)=min(T1);
%     minimo(2)=min(T2);
%     minimo(3)=min(T3);
%     minimo(4)=min(T4);
% else
%     if(min(T1)<minimo(1))
%         minimo(1)=min(T1);
%     end
%     if(min(T2)<minimo(2))
%         minimo(2)=min(T2);
%     end
%     if(min(T3)<minimo(3))
%         minimo(3)=min(T3);
%     end
%     if(min(T4)<minimo(4))
%          minimo(4)=min(T4);
%     end
% end

T5=zeros(1,300);
for i=1:300
    leftMatrix(i,:)=fLeftHandH25([T3(i);T4(i);T2(i);T1(i);T5(i)]);end;

name1='MoroStrettoX';
name2='MoroStrettoY';
name3='MoroStrettoZ';
name4='MoroStrettoWX';
name5='MoroStrettoWY';
name6='MoroStrettoWZ';
namesCoords={name1, name2, name3, name4,name5,name6};
%  learn_dcp_batch(ID1,leftMatrix(:,1)',name1);
%  learn_dcp_batch(ID2,leftMatrix(:,2)',name2);
%  learn_dcp_batch(ID3,leftMatrix(:,3)',name3);

tau  = 0.5;
dt  = 0.001;
len=tau/dt;
x=1:300;
xx=linspace(1,300,floor(len+1)+ 3);
n_rfs     = [15 15 15 15 15 15];
time = (0:1:len)';
index=1;
for i=ID1:ID3
    traj=csaps(x,leftMatrix(:,index)',0.9,xx);
    Y=learn_dcp_batch_oa(i,dt,0,tau,n_rfs(index),0,traj,0,len,namesCoords(index));
    T(:,index)=Y(:,1);%501 valori
    index=index+1;
    dcp('reset_state',i, traj(1));
    dcp('set_goal',i,traj(floor(len+1)),1);
    %   goal(i)=T(floor(len+1),i);
    %     %%%%%%%%%%%%%%per plottare
    %     traj=traj(1:501)';
    % figure(i)
    %
    %     plot(time,Y(:,1),'b -o',time,traj,'r');
    %     title('y');
    %     aa=axis;
    %     axis([min(time) max(time) aa(3:4)]);
    %     %%%%%%%%%%%%%%%%%%%%%%
    
end


%  learn_dcp_batch(ID4,leftMatrix(:,4)',name4);
%  learn_dcp_batch(ID5,leftMatrix(:,5)',name5);
%  learn_dcp_batch(ID6,leftMatrix(:,6)',name6);

% index=4;
% for i=ID4:ID6
%     traj=csaps(x,leftMatrix(:,index)',0.9,xx);
%     Y=learn_dcp_batch_oa(i,dt,0,tau,n_rfs(index),0,traj,0,len,namesCoords(index));
%     T(:,index)=Y(:,1);%501 valori
%     index=index+1;
%     dcp('reset_state',i, traj(1));
%     dcp('set_goal',i,traj(floor(len+1)),1);
%     %  goal(i)=T(floor(len+1),i);
%     %     %%%%%%%%%%%%%%per plottare
%     %     traj=traj(1:501)';
%     % figure(i)
%     %
%     %     plot(time,Y(:,1),'b -o',time,traj,'r');
%     %     title('y');
%     %     aa=axis;
%     %     axis([min(time) max(time) aa(3:4)]);
%     %     %%%%%%%%%%%%%%%%%%%%%%
%     
% end
%   figure(14)
%   plot3(T(:,1),T(:,2),T(:,3),'-')
%   axis equal
% %nao esegue primitiva
% global MOTION
% MOTION.setStiffnesses('Body',1);
% %
% %
% timeLists=linspace(1,10,501);
% size(T);
% trajNao = mat2cell(T(:,19:24),ones(1,501),6);


%MOTION.positionInterpolation('LArm',int16(0),trajNao,int16(63),timeLists,true);

%  if(any(massimo==1000))
%     massimo(1)=max(leftMatrix(:,1)');
%     massimo(2)=max(leftMatrix(:,2)');
%     massimo(3)=max(leftMatrix(:,3)');
%     massimo(4)=max(leftMatrix(:,4)');
%     massimo(5)=max(leftMatrix(:,5)');
%     massimo(6)=max(leftMatrix(:,6)');
% else
%     if(max(leftMatrix(:,1)')>massimo(1))
%         massimo(1)=max(leftMatrix(:,1)');
%     end
%     if(max(leftMatrix(:,2)')>massimo(2))
%         massimo(2)=max(leftMatrix(:,2)');
%     end
%     if(max(leftMatrix(:,3)')>massimo(3))
%         massimo(3)=max(leftMatrix(:,3)');
%     end
%     if(max(leftMatrix(:,4)')>massimo(4))
%         massimo(4)=max(leftMatrix(:,4)');
%     end
%
%     if(max(leftMatrix(:,5)')>massimo(5))
%         massimo(5)=max(leftMatrix(:,5)');
%     end
%
%     if(max(leftMatrix(:,6)')>massimo(6))
%         massimo(6)=max(leftMatrix(:,6)');
%     end
%
% end
%
% if(any(minimo==1000))
%     minimo(1)=min(leftMatrix(:,1)');
%     minimo(2)=min(leftMatrix(:,2)');
%     minimo(3)=min(leftMatrix(:,3)');
%     minimo(4)=min(leftMatrix(:,4)');
%     minimo(5)=min(leftMatrix(:,5)');
%     minimo(6)=min(leftMatrix(:,6)');
% else
%     if(min(leftMatrix(:,1)')>minimo(1))
%         minimo(1)=min(leftMatrix(:,1)');
%     end
%     if(min(leftMatrix(:,2)')>minimo(2))
%         minimo(2)=min(leftMatrix(:,2)');
%     end
%     if(min(leftMatrix(:,3)')>minimo(3))
%         minimo(3)=min(leftMatrix(:,3)');
%     end
%     if(min(leftMatrix(:,4)')>minimo(4))
%         minimo(4)=min(leftMatrix(:,4)');
%     end
%
%     if(min(leftMatrix(:,5)')>minimo(5))
%         minimo(5)=min(leftMatrix(:,5)');
%     end
%
%     if(min(leftMatrix(:,6)')>minimo(6))
%         minimo(6)=min(leftMatrix(:,6)');
%     end
%
% end
%

end