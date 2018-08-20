% 2ns example common-emitter amplifier
function Ze = Zamp2()
  Ze = zeros(2);
  Ze(1,1) = 139.4-i*55.94;
  Ze(1,2) = 0.78+i*0.176;
  Ze(2,1) = -17.99e3+i*8.14e3;
  Ze(2,2) = 70.47-i*28.26;
end