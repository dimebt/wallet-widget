//
//  WalletWidget.swift
//  WalletWidget
//
//  Created by Dimitar Stefanovski on 8/2/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = WalletWidgetEntry
    
    public func snapshot(with context: Context, completion: @escaping (WalletWidgetEntry) -> ()) {
        let entry = WalletWidgetEntry(date: Date())
        completion(entry)
    }
    
    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        // Generate a timeline consisting of one entry with reload policy after 1 min.
        let currentDate = Date()
        let nextUpdateDate = Calendar.current.date(byAdding: .minute,
                                                   value: 1,
                                                   to: currentDate)!
        let entry = WalletWidgetEntry(date: currentDate)
        let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
        completion(timeline)
    }
    
    public func placeholder(in context: Context) -> Entry {
        let entry = WalletWidgetEntry(date: Date())
        return entry
    }
}

struct WalletWidgetEntry: TimelineEntry {
    public let date: Date
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
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WalletWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Wallet Widget")
        .description("Description for the Wallet app widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
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
