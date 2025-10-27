module Robot

mutable struct PlanerRobot
    link_lengths::Vector{Float64}
    joint_angles::Vector{Float64}
    joint_limits::Vector{Float64}
end

end # Robot