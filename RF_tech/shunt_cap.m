function M = shunt_cap(C, w)

# shunt_cap(C, w)
#   C: capacitance
#   w: angular frequency (rad/s)
#
#   Returns the transmission matrix of the
#   shunt capacitor C at frequency w
#

	M = [[1 0]; [i*w*C 1]];


end

