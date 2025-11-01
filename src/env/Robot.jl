module Robot

abstract type Robot end
abstract type PlanerRobot <: Robot end
abstract type SpatialRobot <: Robot end

mutable struct PlanerManipulator <: PlanerRobot
    # name
    # link_color
    # joint_color
    link_lengths::Vector{Float64}
    joint_angles::Vector{Float64}
    joint_limits::Vector{Float64}
end

mutable struct PlanerMobile <: PlanerRobot
    # name
    # base_color
    base_position::Vector{Float64}
    base_angle::Vector{Float64}
end

mutable struct PlanerMobileManipulator <: PlanerRobot
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

mutable struct SpatialManipulator <: SpatialManipulator
    # name
    # link_color
    # joint_color
    link_lengths::Vector{Float64}
    joint_angles::Vector{Float64}
    joint_limits::Vector{Float64}
end

mutable struct SpatialMobile <: SpatialRobot
    # name
    # base_color
    base_position::Vector{Float64}
    base_angle::Vector{Float64}
end

mutable struct SpatialMobileManipulator <: SpatialRobot
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

end # Robot