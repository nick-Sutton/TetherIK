using TetherIK
using GLMakie

function main()
    # Create Planar Manipulator with 3 joints
    link_lengths = [0.4, 0.5, 0.4]
    joint_angles = [π/2, 0.0, 0.0]
    joint_limits = [0.0, 0.0, 0.0]
    robot = PlanarManipulator(link_lengths, joint_angles, joint_limits)
    
    # Create observable for joint angles
    joints_angles_obs = Observable(robot.joint_angles)
    
    # Compute positions reactively
    positions = @lift(fk($joints_angles_obs, link_lengths))
    
    # Create visualization - UNPACK THE TUPLE!
    fig, ax = viz_planar(positions)
    
    # Add sliders to control joints - use fig layout, not indexing
    sg = SliderGrid(fig[2, 1],
        (label = "Joint 1", range = 0:0.01:π, startvalue = π/2),
        (label = "Joint 2", range = -π:0.01:π, startvalue = 0.0),
        (label = "Joint 3", range = -π:0.01:π, startvalue = 0.0),
    )
    
    # Connect sliders to joint angles - USE THE CORRECT VARIABLE NAME
    on(sg.sliders[1].value) do val
        joints_angles_obs[][1] = val
        notify(joints_angles_obs)
    end
    
    on(sg.sliders[2].value) do val
        joints_angles_obs[][2] = val
        notify(joints_angles_obs)
    end
    
    on(sg.sliders[3].value) do val
        joints_angles_obs[][3] = val
        notify(joints_angles_obs)
    end
    
    # Set axis limits - ax is now defined!
    limits!(ax, -2, 2, -2, 2)
    
    # Display env
    display(fig)
    wait(fig.scene)
end

main()