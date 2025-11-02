using LinearAlgebra
using GLMakie

abstract type FKAlgorithm end
struct Trig <: FKAlgorithm end
struct DH <: FKAlgorithm end
struct Screw <: FKAlgorithm end

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
function fk(joint_angles::Vector{Float64}, link_lengths::Vector{Float64}; alg::FKAlgorithm=Trig())
    return fk(joint_angles, link_lengths, alg)
end

function fk(joint_angles::Vector{Float64}, link_lengths::Vector{Float64}, alg::Trig)
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