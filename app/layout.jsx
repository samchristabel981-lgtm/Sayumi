export const metadata = {
  title: "Sayumi",
  description: "Your AI study timer companion 💜",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body style={{ margin: 0, fontFamily: "Inter, sans-serif", background: "#fdfdfd" }}>
        {children}
      </body>
    </html>
  );
    }
