module ForwardKinematics

export forward_kinematics_2d

using LinearAlgebra
using GLMakie

abstract type FKAlgorithm end

struct Trig <: FKAlgorithm
    joint_angles::Vector{Float64}
    link_lengths::Vector{Float64}
end

struct DH <: FKAlgorithm
    joint_angles::Vector{Float64}
    link_lengths::Vector{Float64}
end

struct Screw <: FKAlgorithm
    joint_angles::Vector{Float64}
    link_lengths::Vector{Float64}
end

"""
    # Description
    Computes the desired end-effector pose 
    of a planar robot given a set of joint angles

    # Arguments
    - joint_angles: A list of joint positions
    - link_lengths: A list of link lengths

    # Return
    The end_effector position

"""
function fk(alg::Trig)
    positions = Vector{Point2f}()
    push!(positions, Point2f(0, 0))  # Base position

    curr_position = [0.0, 0.0]
    cumulative_angle = 0.0

    for (angle, length) in zip(joint_angles, link_lengths)
        cumulative_angle += angle
        curr_position += length * [cos(cumulative_angle), sin(cumulative_angle)]
        push!(positions, Point2f(curr_position...))
    end

    return positions
end

function fk(alg::FKAlgorithm=DH(joint_angles, link_lengths))
    positions = Vector{Point2f}() # 3d points
    push!(positions, Point2f(0, 0))  # Base position

    curr_position = [0.0, 0.0]
    cumulative_angle = 0.0

    for (angle, length) in zip(joint_angles, link_lengths)
        cumulative_angle += angle
        curr_position += length * [cos(cumulative_angle), sin(cumulative_angle)]
        push!(positions, Point2f(curr_position...))
    end

    return positions
end

end # ForwardKinematics Module