using GLMakie

"""
    viz_planar(positions::Observable{Vector{Point2f}})

Visualize a planar robot with reactive positions.
"""
function viz_planar(positions::Observable{Vector{Vector{Float64}}})
    positions_2f = @lift(Point2f.($positions))

    fig = Figure(size = (800, 800))
    ax = Axis(fig[1, 1], title = "TetherIK", aspect = DataAspect())
    
    # Add ground plane
    hlines!(ax, 0, color = :black, linewidth = 3)
    poly!(ax, Point2f[(-3, -3), (3, -3), (3, 0), (-3, 0)], 
            color = (:gray, 0.2))
    
    # Plot Links
    lines!(ax, positions_2f, linewidth = 6, color = :purple4)
    
    # Plot Joints
    scatter!(ax, positions_2f, 
                marker = :circle, 
                markersize = 15, 
                color = :crimson,
                strokewidth = 1)
    
    # Plot end effector
    end_effector = @lift($positions_2f[end])
    scatter!(ax, end_effector,
                marker = :hline,
                markersize = 20,
                color = :crimson,
                strokewidth = 1)
    
    limits!(ax, -2, 2, -2, 2)
    
    return fig, ax
end