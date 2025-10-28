module TetherIK

using GLMakie
include("math/kinematics/ForwardKinematics.jl")

function viz_2d(link_lengths = [0.4, 0.5, 0.4],
                init_joint_angles = [π/2, 0.0, 0.0])
    fig = Figure(size = (800, 800))
    ax = Axis(fig[1, 1], title = "TetherIK")

    joint_angles = Observable(init_joint_angles)

    positions = @lift(ForwardKinematics.forward_kinematics_2d($joint_angles, link_lengths))

    # Add ground plane
    hlines!(ax, 0, color = :black, linewidth = 3)
    poly!(ax, Point2f[(-3, -3), (3, -3), (3, 0), (-3, 0)], 
        color = (:gray, 0.2))

    # Plot Links
    lines!(ax, positions, linewidth = 6, color = :purple4)

    # Plot Joints
    scatter!(ax, positions, 
            marker = :circle, 
            markersize = 15, 
            color = :crimson,
            strokewidth = 1)

    # Plot end effector
    end_effector = @lift($positions[end])
    scatter!(ax, end_effector,
            marker = :hline,
            markersize = 20,
            color = :crimson,
            strokewidth = 1)

    # Add sliders for joint control
    sg = SliderGrid(fig[2, 1],
        (label = "Joint 1", range = 0:0.01:π, startvalue = π/2),
        (label = "Joint 2", range = -π:0.01:π, startvalue = π/2),
        (label = "Joint 3", range = -π:0.01:π, startvalue = π/2),
    )
    
    # Connect sliders to joint angles
    on(sg.sliders[1].value) do val
        joint_angles[][1] = val
        notify(joint_angles)
    end
    on(sg.sliders[2].value) do val
        joint_angles[][2] = val
        notify(joint_angles)
    end
    on(sg.sliders[3].value) do val
        joint_angles[][3] = val
        notify(joint_angles)
    end
    
    # Set axis limits
    limits!(ax, -3, 3, -3, 3)
    
    display(fig)
    return fig
end

function main()
    fig = viz_2d()
    wait(fig.scene)
end

# Call main
main()

end # TetherIK