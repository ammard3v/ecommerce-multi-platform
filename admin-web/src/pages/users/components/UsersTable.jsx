import { UsersRow } from "./UsersRow";
export const UsersTable = ({ users, onDelete, onDisable, onEnable }) => {
  if (!users || users.length === 0)
    return <p className="text-gray-500">No users yet.</p>;
  return (
    <div className="overflow-x-auto">
      <table className="table table-zebra table-hover w-full">
        <thead>
          <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Joined Date</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {users.map((user) => (
            <UsersRow
              key={user.id || user._id}
              user={user}
              onDelete={onDelete}
              onDisable={onDisable}
              onEnable={onEnable}
            />
          ))}
        </tbody>
      </table>
    </div>
  );
};
