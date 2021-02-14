//
//  Bars.swift
//  
//
//  Created by Will Dale on 12/01/2021.
//

import SwiftUI

// MARK: Standard
internal struct ColourBar: View {
    
    private let colour      : Color
    private let data        : BarChartDataPoint
    private let maxValue    : Double
    private let chartStyle  : BarChartStyle
    private let style       : BarStyle
    
    internal init(_ colour      : Color,
                  _ data        : BarChartDataPoint,
                  _ maxValue    : Double,
                  _ chartStyle  : BarChartStyle,
                  _ style       : BarStyle
    ) {
        self.colour     = colour
        self.data       = data
        self.maxValue   = maxValue
        self.chartStyle = chartStyle
        self.style      = style
    }
    
    @State private var startAnimation : Bool = false
    
    internal var body: some View {
        RoundedRectangleBarShape(tl: style.cornerRadius.top,
                                 tr: style.cornerRadius.top,
                                 bl: style.cornerRadius.bottom,
                                 br: style.cornerRadius.bottom)
            .fill(colour)
            .scaleEffect(y: startAnimation ? CGFloat(data.value / maxValue) : 0, anchor: .bottom)
            .scaleEffect(x: style.barWidth, anchor: .center)
            .animateOnAppear(using: chartStyle.globalAnimation) {
                self.startAnimation = true
            }
            .animateOnDisappear(using: chartStyle.globalAnimation) {
                self.startAnimation = false
            }
    }
}

internal struct GradientColoursBar: View {
    
    private let colours     : [Color]
    private let startPoint  : UnitPoint
    private let endPoint    : UnitPoint
    private let data        : BarChartDataPoint
    private let maxValue    : Double
    private let chartStyle  : BarChartStyle
    private let style       : BarStyle
    
    internal init(_ colours     : [Color],
                  _ startPoint  : UnitPoint,
                  _ endPoint    : UnitPoint,
                  _ data        : BarChartDataPoint,
                  _ maxValue    : Double,
                  _ chartStyle  : BarChartStyle,
                  _ style       : BarStyle
    ) {
        self.colours    = colours
        self.startPoint = startPoint
        self.endPoint   = endPoint
        self.data       = data
        self.maxValue   = maxValue
        self.chartStyle = chartStyle
        self.style      = style
    }
    
    @State private var startAnimation : Bool = false
    
    internal var body: some View {
        RoundedRectangleBarShape(tl: style.cornerRadius.top,
                                 tr: style.cornerRadius.top,
                                 bl: style.cornerRadius.bottom,
                                 br: style.cornerRadius.bottom)
            .fill(LinearGradient(gradient: Gradient(colors: colours),
                                 startPoint: startPoint,
                                 endPoint: endPoint))
            .scaleEffect(y: startAnimation ? CGFloat(data.value / maxValue) : 0, anchor: .bottom)
            .scaleEffect(x: style.barWidth, anchor: .center)
            .animateOnAppear(using: chartStyle.globalAnimation) {
                self.startAnimation = true
            }
            .animateOnDisappear(using: chartStyle.globalAnimation) {
                self.startAnimation = false
            }
    }
}

internal struct GradientStopsBar: View {
    
    private let stops       : [Gradient.Stop]
    private let startPoint  : UnitPoint
    private let endPoint    : UnitPoint
    private let data        : BarChartDataPoint
    private let maxValue    : Double
    private let chartStyle  : BarChartStyle
    private let style       : BarStyle
    
    internal init(_ stops       : [Gradient.Stop],
                  _ startPoint  : UnitPoint,
                  _ endPoint    : UnitPoint,
                  _ data        : BarChartDataPoint,
                  _ maxValue    : Double,
                  _ chartStyle  : BarChartStyle,
                  _ style       : BarStyle
    ) {
        self.stops      = stops
        self.startPoint = startPoint
        self.endPoint   = endPoint
        self.data       = data
        self.maxValue   = maxValue
        self.chartStyle = chartStyle
        self.style      = style
    }
    
    @State private var startAnimation : Bool = false
    
    internal var body: some View {
        RoundedRectangleBarShape(tl: style.cornerRadius.top,
                                 tr: style.cornerRadius.top,
                                 bl: style.cornerRadius.bottom,
                                 br: style.cornerRadius.bottom)
            .fill(LinearGradient(gradient: Gradient(stops: stops),
                                 startPoint: startPoint,
                                 endPoint: endPoint))
            .scaleEffect(y: startAnimation ? CGFloat(data.value / maxValue) : 0, anchor: .bottom)
            .scaleEffect(x: style.barWidth, anchor: .center)
            .animateOnAppear(using: chartStyle.globalAnimation) {
                self.startAnimation = true
            }
            .animateOnDisappear(using: chartStyle.globalAnimation) {
                self.startAnimation = false
            }
    }
}

// MARK: - Multi Part

internal struct ColourPartBar: View {
    
    private let colour  : Color
    private let height  : CGFloat
    
    internal init(_ colour  : Color,
                  _ height  : CGFloat
    ) {
        self.colour     = colour
        self.height     = height
    }
        
    internal var body: some View {
        Rectangle()
            .fill(colour)
            .frame(height: height)
    }
}

internal struct GradientColoursPartBar: View {
    
    private let colours     : [Color]
    private let startPoint  : UnitPoint
    private let endPoint    : UnitPoint
    private let height      : CGFloat
    
    internal init(_ colours     : [Color],
                  _ startPoint  : UnitPoint,
                  _ endPoint    : UnitPoint,
                  _ height      : CGFloat
    ) {
        self.colours    = colours
        self.startPoint = startPoint
        self.endPoint   = endPoint
        self.height     = height
    }
        
    internal var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient   : Gradient(colors: colours),
                                 startPoint : startPoint,
                                 endPoint   : endPoint))
            .frame(height: height)
    }
}

internal struct GradientStopsPartBar: View {
    
    private let stops       : [Gradient.Stop]
    private let startPoint  : UnitPoint
    private let endPoint    : UnitPoint
    private let height      : CGFloat
    
    internal init(_ stops       : [Gradient.Stop],
                  _ startPoint  : UnitPoint,
                  _ endPoint    : UnitPoint,
                  _ height      : CGFloat
    ) {
        self.stops      = stops
        self.startPoint = startPoint
        self.endPoint   = endPoint
        self.height     = height
    }
        
    internal var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient   : Gradient(stops: stops),
                                 startPoint : startPoint,
                                 endPoint   : endPoint))
            .frame(height: height)
    }
}
