module Robot

mutable struct PlanerManipulator
    # name
    # link_color
    # joint_color
    link_lengths::Vector{Float64}
    joint_angles::Vector{Float64}
    joint_limits::Vector{Float64}
end

mutable struct PlanerRobot
    # name
    # base_color
    base_position::Vector{Float64}
    base_angle::Vector{Float64}
end

mutable struct PlanerMobileManipulator
    # name
    # base_color
    # link_color
    # joint_color
    base_position::Vector{Float64}
    base_angle::Vector{Float64}
    link_lengths::Vector{Float64}
    joint_angles::Vector{Float64}
    joint_limits::Vector{Float64}
end

mutable struct CartPole
    # name
    # base_color
    base_position::Vector{Float64}
    base_angle::Vector{Float64}
end

end # Robot