import { useUsers } from "./hooks/UsersHook";
import { UsersTable } from "./components/UsersTable";
export const UsersPage = () => {
  const { users, isLoading, disableUser, enableUser } = useUsers();
  return (
    <div className="card bg-base-100 rounded-2xl shadow-2xl p-6">
      <div>
        <h1 className="text-2xl font-bold">Users</h1>
        <p className="text-gray-500 mt-1">
          {users.length} {users.length === 1 ? "user" : "users"} registered
        </p>
      </div>
      {isLoading ? (
        <p>Loading...</p>
      ) : (
        <UsersTable
          users={users}
          onDisable={disableUser}
          onEnable={enableUser}
        />
      )}
    </div>
  );
};
export default UsersPage;
