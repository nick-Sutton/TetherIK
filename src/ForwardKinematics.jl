module ForwardKinematics

export fk_2d

using LinearAlgebra
using GLMakie

function fk_2d(joint_angles, link_lengths)
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

end # ForwardKinematics