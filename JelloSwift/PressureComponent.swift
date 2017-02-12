//
//  PressureComponent.swift
//  JelloSwift
//
//  Created by Luiz Fernando Silva on 16/08/14.
//  Copyright (c) 2014 Luiz Fernando Silva. All rights reserved.
//

import CoreGraphics

// Represents a Pressure component that can be added to a body to include gas pressure as an internal force
public final class PressureComponent: BodyComponent
{
    // PRIVATE VARIABLES
    public var volume: CGFloat = 0
    public var gasAmmount: CGFloat = 0
    
    override public func prepare(_ body: Body)
    {
        
    }
    
    override public func accumulateInternalForces(in body: Body)
    {
        super.accumulateInternalForces(in: body)
        
        volume = 0
        
        let c = body.pointMasses.count
        
        if(c < 1)
        {
            return
        }
        
        volume = max(0.5, polygonArea(body.pointMasses))
        
        // now loop through, adding forces!
        let invVolume = 1 / volume
        
        for (i, e) in body.edges.enumerated()
        {
            let j = (i + 1) % c
            let pressureV = (invVolume * e.length * gasAmmount)
            
            body.pointMasses[i].applyForce(of: body.pointNormals[i] * pressureV)
            body.pointMasses[j].applyForce(of: body.pointNormals[j] * pressureV)
        }
    }
}

// Creator for the Spring component
open class PressureComponentCreator : BodyComponentCreator
{
    open var gasAmmount: CGFloat
    
    public required init(gasAmmount: CGFloat = 0)
    {
        self.gasAmmount = gasAmmount
        
        super.init()
        
        bodyComponentClass = PressureComponent.self
    }
    
    open override func prepareBodyAfterComponent(_ body: Body)
    {
        body.getComponentType(PressureComponent.self)?.gasAmmount = gasAmmount
    }
}
