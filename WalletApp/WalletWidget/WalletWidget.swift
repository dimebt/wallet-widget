//
//  WalletWidget.swift
//  WalletWidget
//
//  Created by Dimitar Stefanovski on 8/2/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry
    
    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }
    
    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    var body: some View {
        Text("Loading..")
    }
}

struct WalletWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family
    
    @ViewBuilder
    var body: some View {
        //Text(entry.date, style: .time)
        switch family {
        case .systemSmall:
            WWidgetSmall()
        case .systemMedium:
            WWidgetMedium(transactions: mockLast2Transactions)
        case .systemLarge:
            WWidgetLarge(transactions: mockTransactions, card: masterCardPay)
        @unknown default:
            fatalError()
        }
    }
}

@main
struct WalletWidget: Widget {
    private let kind: String = "WalletWidget"
    
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            WalletWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WalletWidget_Previews: PreviewProvider {
    static var previews: some View {

        Group {
            WWidgetSmall()
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            
            WWidgetMedium()
                .previewContext(WidgetPreviewContext(family: .systemMedium))

            WWidgetLarge()
                .previewContext(WidgetPreviewContext(family: .systemLarge))
        }
    }
}
