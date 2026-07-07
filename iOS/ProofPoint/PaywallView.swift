import SwiftUI

struct PaywallView: View {
    @EnvironmentObject var purchases: PurchaseManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Theme.background.ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "star.circle.fill")
                    .font(.system(size: 64))
                    .foregroundColor(Theme.accent)
                    .padding(.top, 40)

                Text("Proof Point Pro")
                    .font(Theme.titleFont)
                    .foregroundColor(Theme.primaryText)

                Text("Multi-stage proof timers with push alerts")
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.secondaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)

                Spacer()

                Button {
                    Task { await purchases.purchase() }
                } label: {
                    Text("Unlock Pro — $3.99 one-time")
                        .font(Theme.headlineFont)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Theme.accent)
                        .cornerRadius(14)
                }
                .accessibilityIdentifier("paywallPurchaseButton")
                .padding(.horizontal, 24)

                Button("Restore Purchases") {
                    Task { await purchases.restore() }
                }
                .accessibilityIdentifier("paywallRestoreButton")
                .foregroundColor(Theme.secondaryText)

                Button("Not Now") { dismiss() }
                    .accessibilityIdentifier("paywallDismissButton")
                    .foregroundColor(Theme.secondaryText)
                    .padding(.bottom, 24)
            }
        }
    }
}
