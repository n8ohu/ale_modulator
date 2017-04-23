%
% MATLAB script to generate the ALE symbol library according to
% MIL-STD-188-141B.
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 750 Hz tone with zero initial phase and sufficient magnitude for
% around 0.8 amplitude in time domain
fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

fd_in_i(7) = 26;
fd_in_q(7) = 0;
fd_in_i(59) = 26;
fd_in_q(59) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_750 = ifft(fd_in);

figure(1);
plot(real(td_out_750) + imag(td_out_750));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 1000 Hz tone with zero initial phase
fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

fd_in_i(9) = 26;
fd_in_q(9) = 0;
fd_in_i(57) = 26;
fd_in_q(57) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_1000 = ifft(fd_in);

figure(2);
plot(real(td_out_1000) + imag(td_out_1000));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 1250 Hz tone with zero initial phase
fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

fd_in_i(11) = 26;
fd_in_q(11) = 0;
fd_in_i(55) = 26;
fd_in_q(55) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_1250 = ifft(fd_in);

% figure(3);
% plot(real(td_out_1250) + imag(td_out_1250));

fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 1500 Hz tone with zero initial phase
fd_in_i(13) = 26;
fd_in_q(13) = 0;
fd_in_i(53) = 26;
fd_in_q(53) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_1500 = ifft(fd_in);

figure(4);
plot(real(td_out_1500) + imag(td_out_1500));

fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 1750 Hz tone with zero initial phase
fd_in_i(15) = 26;
fd_in_q(15) = 0;
fd_in_i(51) = 26;
fd_in_q(51) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_1750 = ifft(fd_in);

figure(5);
plot(real(td_out_1750) + imag(td_out_1750));

fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 2000 Hz tone with zero initial phase
fd_in_i(17) = 26;
fd_in_q(17) = 0;
fd_in_i(49) = 26;
fd_in_q(49) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_2000 = ifft(fd_in);

figure(6);
plot(real(td_out_2000) + imag(td_out_2000));

fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 2250 Hz tone with zero initial phase
fd_in_i(19) = 26;
fd_in_q(19) = 0;
fd_in_i(47) = 26;
fd_in_q(47) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_2250 = ifft(fd_in);

figure(7);
plot(real(td_out_2250) + imag(td_out_2250));

fd_in_i = zeros(1,64);
fd_in_q = zeros(1,64);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate 2500 Hz tone with zero initial phase
fd_in_i(21) = 26;
fd_in_q(21) = 0;
fd_in_i(45) = 26;
fd_in_q(45) = 0;

% make complex vector for the IFFT
fd_in = complex(fd_in_i, fd_in_q);

% do the iFFT
td_out_2500 = ifft(fd_in);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate the c-header

fid = fopen('ale_symbol_library.h','w');
fprintf(fid,'/*\n');
fprintf(fid,' * ALE Symbol library\n');
fprintf(fid,' *\n');
fprintf(fid,' * Generated by ale_symbol_library.m according to MIL-STD-188-141B.\n');
fprintf(fid,' * Copyright (C) 2017 Devin Butterfield (dbutter@wireless.net)\n\n');
fprintf(fid,' * This program is free software; you can redistribute it and/or modify\n');
fprintf(fid,' * it under the terms of the GNU General Public License as published by\n');
fprintf(fid,' * the Free Software Foundation; either version 2 of the License, or\n');
fprintf(fid,' * (at your option) any later version.\n');
fprintf(fid,' *\n');
fprintf(fid,' * This program is distributed in the hope that it will be useful,\n');
fprintf(fid,' * but WITHOUT ANY WARRANTY; without even the implied warranty of\n');
fprintf(fid,' * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n');
fprintf(fid,' * GNU General Public License for more details.\n');
fprintf(fid,' *\n');
fprintf(fid,' * You should have received a copy of the GNU General Public License\n');
fprintf(fid,' * along with this program; if not, write to the Free Software\n');
fprintf(fid,' * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.\n');
fprintf(fid,' */\n\n');
fprintf(fid,'#ifndef _ALE_SYMBOL_LIBRARY_H\n');
fprintf(fid,'#define _ALE_SYMBOL_LIBRARY_H\n\n');
fprintf(fid,'#define ALE_SYMBOL_COUNT %d\n',8);
fprintf(fid,'#define ALE_SYMBOL_SIZE %d\n\n',length(td_out_750));
fprintf(fid,'/* max signal amplitude: %f */\n\n', max(td_out_750));
fprintf(fid,'#define ALE_SYMBOL_LIBRARY { \\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_750 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_1000 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_1500 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_1250 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_2500 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_2250 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_1750 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'    {\\\n');
fprintf(fid,'        %d,\\\n',int16(td_out_2000 * 2^15));
fprintf(fid,'    },\\\n');
fprintf(fid,'};\n\n');
fprintf(fid,'#endif/*_ALE_SYMBOL_LIBRARY_H*/\n');


fclose(fid);