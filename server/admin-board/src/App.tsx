import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { Router } from "./routes/Routes";

const client = new QueryClient({
  defaultOptions: {
    queries: {
      refetchOnWindowFocus: false,
      staleTime: Infinity,
      cacheTime: 0,
    },
  },
});

export const App: React.FC = () => (
  <QueryClientProvider client={client}>
    <Router />
  </QueryClientProvider>
);
