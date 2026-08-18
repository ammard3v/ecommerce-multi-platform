import { useQuery } from "@tanstack/react-query";
import PageLoader from "../../components/PageLoader";
import { StatsCards } from "./StatsCards";
import { RecentOrdersTable } from "./RecentOrdersTable";
import { orderApi, statsApi } from "../../lib/api";
function DashboardPage() {
  const {
    data: recentOrders = [],
    isLoading: ordersLoading,
    isError: ordersError,
  } = useQuery({
    queryKey: ["orders"],
    queryFn: orderApi.getAll,
    staleTime: 0,
    refetchOnMount: "always",
    refetchOnWindowFocus: true,
  });
  const {
    data: statsResponse,
    isLoading: statsLoading,
    isError: statsError,
  } = useQuery({
    queryKey: ["dashboardStats"],
    queryFn: statsApi.getDashboard,
    staleTime: 0,
    refetchOnMount: "always",
    refetchOnWindowFocus: true,
  });
  const stats = statsResponse?.data?.stats || statsResponse || {};
  if (ordersLoading || statsLoading) return <PageLoader />;
  if (ordersError || statsError)
    return (
      <div className="p-8 text-red-500 text-center">
        Error loading dashboard. Please refresh the page.
      </div>
    );
  return (
    <div className="space-y-8 p-4 min-h-[600px]">
      <StatsCards stats={stats} />
      <div className="card bg-base-100 rounded-2xl shadow-2xl">
        <div className="card-body">
          <h2 className="card-title mb-4 text-lg font-semibold">
            Recent Orders
          </h2>
          <RecentOrdersTable orders={recentOrders} />
        </div>
      </div>
    </div>
  );
}
export default DashboardPage;
