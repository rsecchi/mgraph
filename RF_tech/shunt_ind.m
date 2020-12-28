function M = shunt_ind(L, w)

# shunt_ind(L, w)
#   L: capacitance
#   w: angular frequency (rad/s)
#
#   Returns the transmission matrix of the
#   shunt inductor L at frequency w
#

	M = [[1 0]; [1/(i*w*L) 1]];

end

